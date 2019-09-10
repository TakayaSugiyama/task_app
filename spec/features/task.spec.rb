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
     select "2017" , from: "task_deadline_1i"
     select "9" , from: "task_deadline_2i"
     select "20" , from: "task_deadline_3i"
     select  "最優先", from: "task_priority"
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

  # 締め切りのソート機能のテスト 
  scenario "一覧画面で締め切りのソートのリンクを押されたとき、タスクがソートされているかのテスト" do 
    task1 = FactoryBot.create(:task)
    task2 = FactoryBot.create(:task,deadline: "2020-09-09 07:35:38")
    task3 = FactoryBot.create(:task,deadline: "2050-09-09 07:35:38")
    visit root_path
    click_link "終了期限でソートする"
    tasks = page.all(".task_deadline")
    expect(tasks[0].text).to have_content "2019年 09月 09日"
    expect(tasks[1].text).to have_content "2020年 09月 09日"
    expect(tasks[2].text).to have_content "2050年 09月 09日"
  end 

  #優先順位のソート機能のテスト 
  scenario "一覧画面で優先順位のソートのリンクを押されたとき、タスクがソートされているかのテスト" do 
    task1 = FactoryBot.create(:task)
    task2 = FactoryBot.create(:task,priority: "最優先")
    task3 = FactoryBot.create(:task,priority: "後回し")
    visit root_path
    click_link "優先順位でソートする"
    tasks = page.all(".task_priority")
    expect(tasks[0].text).to have_content "最優先"
    expect(tasks[1].text).to have_content "普通"
    expect(tasks[2].text).to have_content "後回し"
  end
end