require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  scenario "タスク一覧のテスト" do
     Task.create!(title: "test_task_01", content: "testtesttest")
     Task.create!(title: "test_task_02", content: "samplesample")

     visit root_path

     expect(page).to have_content "testtesttest"
     expect(page).to have_content "samplesample"
  end

  scenario "タスク作成のテスト" do
     
  end

  scenario "タスク詳細のテスト" do

  end
end