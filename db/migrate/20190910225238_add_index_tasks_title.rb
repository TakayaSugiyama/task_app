class AddIndexTasksTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, [:title,:condition]
  end
end
