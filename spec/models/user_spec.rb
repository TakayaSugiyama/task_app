require 'rails_helper'

RSpec.describe User, type: :model do
  it "ユーザー名が空ならバリデーションが通らない" do 
    user = FactoryBot.build(:user,name: nil)
    user.valid? 
    expect(user.errors[:name]).to include "を入力してください"
  end

  it "メールアドレスが空ならバリデーションが通らない" do 
    user = FactoryBot.build(:user,email: nil)
    user.valid? 
    expect(user.errors[:email]).to include "を入力してください"
  end

  it "パスワードが空ならバリデーションが通らない" do 
    FactoryBot.create(:user)
    user = FactoryBot.build(:user, password: nil)
    user.valid? 
    expect(user.errors[:password]).to include "を入力してください"
  end

  it "既に登録されたメールアドレスで登録しようとするとバリデーションが通らない" do 
    FactoryBot.create(:user)
    user = FactoryBot.build(:user) 
    user.valid? 
    expect(user.errors[:email]).to include "はすでに存在します"
  end 
  
  it "メールアドレスのフォーマットでバリデーションが通らない"  do 
    user = FactoryBot.build(:user, email: "fiwejfwirefwfjaifjew")
    user.valid? 
    expect(user.errors[:email]).to include "は不正な値です" 
  end
end
