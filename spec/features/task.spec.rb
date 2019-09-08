require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  scenario "タスク一覧のテスト" do
     FactoryBot.create(:task, content: "testtesttest")
     FactoryBot.create(:task, content: "samplesample")

     visit root_path

     expect(page).to have_content "testtesttest"
     expect(page).to have_content "samplesample"
  end

  scenario "タスク作成のテスト" do
     visit new_task_path 
     fill_in "タスク名", with: "test_task"
     fill_in "タスク詳細" ,with: "testtesttest"
     click_button "登録する"
     expect(page).to  have_content "タスク「test_task」を作成しました"
  end

  scenario "タスク詳細のテスト" do
      task = FactoryBot.create(:task)
      visit task_path(task.id)
      expect(page).to have_content "testtesttest"
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
     task1 = FactoryBot.create(:task,title: "task1")
     task2 = FactoryBot.create(:task,title: "task2")
     task3 = FactoryBot.create(:task,title: "task3")
     visit root_path
     tasks =  page.all(".task_title") 
     expect(tasks[0].text).to have_content "task3"
     expect(tasks[1].text).to have_content "task2"
     expect(tasks[2].text).to have_content "task1"
  end
end