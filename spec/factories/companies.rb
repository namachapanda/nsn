# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    schema_code 1
    domain_id "MyString"
    name "MyString"
    code "MyString"
    status_id 1
  end
end
