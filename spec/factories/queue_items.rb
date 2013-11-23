# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :queue_item do
    message nil
    sender nil
    recipient nil
  end
end
