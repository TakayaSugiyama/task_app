require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "ユーザー登録"  do 
    visit new_user_path 
    fill_in "ユーザー名" , with: "リラックマ"
    fill_in "メールアドレス", with: "relaxbear@gmail.com"
    fill_in "パスワード", with: "relaxbear"
    fill_in "パスワード(確認)", with: "relaxbear"
    click_button "登録する"
    expect(page).to have_content "リラックマのページ"
  end 

  scenario "既に登録されたメールアドレスで登録しようとするとエラー" do 
    FactoryBot.create(:user)
    visit new_user_path 
    fill_in "ユーザー名" , with: "コリックマ"
    fill_in "メールアドレス", with: "relaxbear@gmail.com"
    fill_in "パスワード", with: "relaxbear"
    fill_in "パスワード(確認)", with: "relaxbear"
    click_button "登録する"
    expect(page).to have_content "メールアドレスはすでに存在します"
  end

  

end
