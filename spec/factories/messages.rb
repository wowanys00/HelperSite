FactoryBot.define do
  factory :message do
    body {"x"}
    conversation_id {1}
    user_id {1}
  end
end