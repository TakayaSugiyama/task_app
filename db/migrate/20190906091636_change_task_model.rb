class ChangeTaskModel < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :task_name, :title 
    rename_column :tasks, :task_content, :content
  end
end
