# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    actor ""
    object ""
    target ""
    sender nil
    receiver nil
    target nil
  end
end
