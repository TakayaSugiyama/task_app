class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {maximum: 100}, presence: true
  validates :deadline, presence: true
  # 0: 最優先, 1:優先, 2: 普通, 3:後回し で設定する
  enum priority: {"最優先": 0, "優先": 1, "普通": 2, "後回し": 3}
  # １:未着手, 2:着手中, 3:完了 で設定する
  enum condition: {todo: 1, doing:2, done:3 }

  def self.restricted_conditions
    conditionss.except :failed, :destroyed
  end
end
