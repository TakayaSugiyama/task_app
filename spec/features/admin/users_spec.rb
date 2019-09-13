require 'rails_helper'

RSpec.feature "Admin::Users", type: :feature do
  require 'rails_helper'

  scenario "ユーザー登録"  do 
    visit new_admin_user_path 
    fill_in "ユーザー名" , with: "リラックマ"
    fill_in "メールアドレス", with: "relaxbear@gmail.com"
    fill_in "パスワード", with: "relaxbear"
    fill_in "パスワード(確認)", with: "relaxbear"
    click_button "登録する"
    expect(page).to have_content "リラックマのページ"
  end 

  scenario "既に登録されたメールアドレスで登録しようとするとエラー" do 
    FactoryBot.create(:user)
    visit new_admin_user_path 
    fill_in "ユーザー名" , with: "コリラックマ"
    fill_in "メールアドレス", with: "relaxbear@gmail.com"
    fill_in "パスワード", with: "relaxbear"
    fill_in "パスワード(確認)", with: "relaxbear"
    click_button "登録する"
    expect(page).to have_content "メールアドレスはすでに存在します"
  end 

  scenario "パスワードを6文字未満で登録しようとするとエラー" do
    visit new_admin_user_path 
    fill_in "ユーザー名" , with: "コリラックマ"
    fill_in "メールアドレス", with: "relaxbear@gmail.com"
    fill_in "パスワード", with: "relax"
    fill_in "パスワード(確認)", with: "relax"
    click_button "登録する"
    expect(page).to have_content "パスワードは6文字以上で入力してください"
  end

  scenario  "ログインに失敗する"  do 
    user = FactoryBot.create(:user)
    visit login_path 
    fill_in "メールアドレス" ,with: "koribear@gmail.com"
    fill_in "パスワード", with: "koribear"
    click_button "ログインする"
    expect(page).to have_content "ログインに失敗しました"
  end

  scenario "非ログインユーザーがタスクのページに飛ぼうとした場合は、ログインページに遷移" do 
    visit root_path 
    expect(page).to have_content "ログインしてください"
  end

  describe "ログイン後に使える機能" do 
    before  "ログイン" do  
      @user = FactoryBot.create(:user)
      visit login_path 
      fill_in "メールアドレス" ,with: "relaxbear@gmail.com"
      fill_in "パスワード", with: "relaxbear"
      click_button "ログインする"
    end

    it "正しくログインできる" do
      expect(page).to have_content "ログインしました"
    end

    it "正しくログアウトできる" do 
      click_link "ログアウト"
      expect(page).to  have_content "ログアウトしました"
    end

    it "ログインユーザーは新規登録ページにアクセスできない" do
       visit new_admin_user_path 
       expect(page).to have_content "ログインしています"
    end

    it "他の人のマイページにアクセスできない" do 
      user = FactoryBot.create(:user,id:2, email: "kori@gmail.com")
      visit  admin_user_path(user)
      expect(page).to have_content "権限がありません"
    end

  end


end
