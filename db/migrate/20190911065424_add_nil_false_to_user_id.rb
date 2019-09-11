class AddNilFalseToUserId < ActiveRecord::Migration[5.2]
  def up 
    change_column_null :tasks, :user_id, false, 1
    change_column      :tasks, :user_id, :bigint,default: 1
  end

  def down 
    change_column_null :users, :user_id, ture, nil 
    change_column      :users, :user_id, :bigint, default: nil
  end
end
