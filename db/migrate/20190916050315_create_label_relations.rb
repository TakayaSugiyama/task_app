class CreateLabelRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :label_relations do |t|
      t.integer :task_id, null: false
      t.integer :label_id, null: false

      t.timestamps
    end
  end
end
