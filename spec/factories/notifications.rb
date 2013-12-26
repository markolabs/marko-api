# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
<<<<<<< HEAD
    actor ""
    object ""
    target ""
=======
    sender nil
    receiver nil
    target nil
>>>>>>> dev
  end
end
