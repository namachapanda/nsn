# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :information do
    info "MyString"
    renew Time.now
  end
end
