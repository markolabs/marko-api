# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ping do
    latitude 1.5
    longitude 1.5
    user nil
  end
end
