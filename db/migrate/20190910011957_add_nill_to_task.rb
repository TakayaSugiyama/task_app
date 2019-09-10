class AddNillToTask < ActiveRecord::Migration[5.2]
    def up 
      change_column_null :tasks, :status, false, 2
      change_column  :tasks, :status, :integer, default: 2
    end 

    def down 
      change_column_null :tasks, :status, true, nil 
      change_column :tasks, :status, :integer, default: nil
    end
end
