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
    task = FactoryBot.create(:task)
    expect(task).to be_valid
  end

  # 追加
  it "contentが101文字以上の場合はバリデーションを通らない" do 
    task = FactoryBot.build(:task, content: "あ" * 101) 
    task.valid?
    expect(task.errors[:content]).to  include "は100文字以内で入力してください"
  end
end
