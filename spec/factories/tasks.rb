FactoryBot.define do
  factory :task do
    title {"test_task"}
    content {"testtesttest"}
    deadline {"2019-09-09 07:35:38"}
    priority {"普通"}
    condition {"todo"}  #未着手
  end
end
