require 'rails_helper'

RSpec.feature "Admin::Users", type: :feature do
   #一覧・作成・詳細・更新・削除のテストを全て書く 
   describe "ユーザー管理機能" do 
    before do 
      FactoryBot.create(:user, admin: true,id:2)
      FactoryBot.create(:user,name: "コリラックマ",id:3, email: "kori@gmail.com",admin: true)
      # ログインする
      visit login_path 
      fill_in "メールアドレス" ,with: "relaxbear@gmail.com"
      fill_in "パスワード", with: "relaxbear"
      click_button "ログインする"
      visit admin_users_path
    end
    
    #一覧
    it "ユーザーが一覧で並んでいるか"  do 
      users = page.all(".user-name")
      expect(users[0].text).to have_content "リラックマ"
      expect(users[1].text).to have_content  "コリラックマ"
    end 
    
    #詳細
    it "ユーザー詳細のテスト" do 
      within("#show2") do
        click_on  "詳細"
      end
      expect(page).to have_content "リラックマのページ"
    end
    
    
    #更新 
    it "一覧画面からユーザー情報を更新する" do 
      within("#edit2") do 
        click_link  "編集"
      end
      fill_in "ユーザー名" ,with: "コリラックマ"
      fill_in "メールアドレス",with: "kori@gmail.com"
      click_on "更新する"
      visit admin_users_path 
      users = page.all(".user-name") 
      expect(users[1].text).to have_content "コリラックマ"
    end

    #削除
    it "一覧画面からユーザーを削除する" do 
      within("#destory3") do
        click_on  "削除"
      end
      expect(page).to have_content "「コリラックマ」を削除しました"
    end 

    #作成 
    it "ユーザーを新規作成する" do 
      click_button "ユーザーを新規作成する"
      fill_in "ユーザー名" , with: "コリラックマ"
      fill_in "メールアドレス", with: "yellow@gmail.com"
      fill_in "パスワード", with: "yellowbird"
      fill_in "パスワード(確認)", with: "yellowbird"
      click_button "登録する"
      expect(page).to have_content "登録しました"
    end
end
end
