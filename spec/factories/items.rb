# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    no 1
    name "MyString"
    price "9.99"
    category_id 1
    color_id 1
    img "MyString"
    explain "MyText"
  end
end
