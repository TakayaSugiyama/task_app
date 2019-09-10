class AddConditionToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :condition, :integer
  end
end
