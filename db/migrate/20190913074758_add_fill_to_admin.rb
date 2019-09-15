class AddFillToAdmin < ActiveRecord::Migration[5.2]
  def up 
    change_column_null :users, :admin, false, false
    change_column :users, :admin, :boolean, default: false
  end

  def down 
    change_column_null :users, :admin, true, false
    change_column :users, :admin, :boolean, default: nil
  end
end
