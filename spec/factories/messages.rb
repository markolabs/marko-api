# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    latitude 1.5
    longitude 1.5
    type ""
    image ""
    caption "MyString"
    user nil
  end
end
