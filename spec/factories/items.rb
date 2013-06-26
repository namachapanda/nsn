# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    no 2222
    name "MyString"
    price "999"
    category_id 1
    color_id 1
    img "2222.jpg"
    explanation "MyText"
  end
end
