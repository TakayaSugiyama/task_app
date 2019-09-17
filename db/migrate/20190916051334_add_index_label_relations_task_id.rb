class AddIndexLabelRelationsTaskId < ActiveRecord::Migration[5.2]
  def change
    add_index  :label_relations, [:task_id ,:label_id]
  end
end
