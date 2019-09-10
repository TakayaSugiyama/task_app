class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {maximum: 100}, presence: true
  validates :deadline, presence: true
  # 0: 最優先, 1:優先, 2: 普通, 3:後回し で設定する
  enum status: {"最優先": 0, "優先": 1, "普通": 2, "後回し": 3}
end
