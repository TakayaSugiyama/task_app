class AddNullToDeadline < ActiveRecord::Migration[5.2]
  def up
    change_column_null :tasks, :deadline, false, DateTime.current
    change_column :tasks, :deadline, :datetime, default: DateTime.current
  end

  def down
    change_column_null :tasks, :deadline, true, nil
    change_column :tasks, :deadline, :detetime, default: nil
  end
end
