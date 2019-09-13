require 'rails_helper'

RSpec.describe Task, type: :model do
  it "titleが空ならバリデーションが通らない" do
    task = FactoryBot.build(:task, title:nil)
    task.valid? 
    expect(task.errors[:title]).to include "を入力してください"
  end

  it "contentが空ならバリデーションが通らない" do 
    task = FactoryBot.build(:task, content: nil)
    task.valid?
    expect(task.errors[:content]).to include  "を入力してください" 
  end 

  it "titleとcontentに内容が記載されていればバリデーションを通る" do
    user = FactoryBot.create(:user)
    task = FactoryBot.create(:task)
    expect(task).to be_valid
  end

  # 追加
  it "contentが101文字以上の場合はバリデーションを通らない" do 
    task = FactoryBot.build(:task, content: "あ" * 101) 
    task.valid?
    expect(task.errors[:content]).to  include "は100文字以内で入力してください"
  end

  #検索 
  describe "検索のテスト" do 
    before do 
      @user = FactoryBot.create(:user)
      @task1 = FactoryBot.create(:task)
      @task2 = FactoryBot.create(:task, title: "test_task2", condition: 3)  #condition  3:完了
      @task3 = FactoryBot.create(:task, title: "test_task3")
    end

    it "タスク名の検索が帰ってくる" do 
      expect(Task.ransack(title_eq: "test_task3").result).to include(@task3)
    end 

    it "タスク名を入力せずに検索すると値が帰ってくる" do 
      expect(Task.ransack(condition_eq: 3).result).to include(@task2)
    end
  end
end
