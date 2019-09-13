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

   #一覧・作成・詳細・更新・削除のテストを全て書く 
   describe "ユーザー管理機能" do 
      before do 
        FactoryBot.create(:user)
        FactoryBot.create(:user,name: "キイロイトリ",id:2, email: "kori@gmail.com")
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
        expect(users[1].text).to have_content  "キイロイトリ"
      end 
      
      #詳細
      it "ユーザー詳細のテスト" do 
        within("#show2") do
          click_on  "詳細"
        end
        expect(page).to have_content "キイロイトリのページ"
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
        within("#destory2") do
          click_on  "削除"
        end
        expect(page).to have_content "「キイロイトリ」を削除しました"
      end 

      #作成 
      it "ユーザーを新規作成する" do 
        #userのidが2のユーザーを作ってしまいバリデーションエラーが起きるので、先にidが２のユーザーを削除する
        within("#destory2") do
          click_on  "削除"
        end
        click_button "ユーザーを新規作成する"
        fill_in "ユーザー名" , with: "キイロイトリ"
        fill_in "メールアドレス", with: "yellow@gmail.com"
        fill_in "パスワード", with: "yellowbird"
        fill_in "パスワード(確認)", with: "yellowbird"
        click_button "登録する"
        expect(page).to have_content "キイロイトリのページ"
      end
  end
end

