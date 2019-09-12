FactoryBot.define do
  factory :task do
    title {"test_task"}
    content {"testtesttest"}
    deadline {"2019-09-09 07:35:38"}
    priority {2}  #普通
    condition {1}  #未着手
    user_id {1}
  end
end
