class AddNullToCondition < ActiveRecord::Migration[5.2]
  def up 
    change_column_null :tasks,:condition,false , 0
    change_column      :tasks,:condition, :integer, default: 0 
  end

  def down 
    change_column_null :tasks, :condition, ture, nil 
    change_column      :tasks, :condition, :integer, default: nil
  end
end
