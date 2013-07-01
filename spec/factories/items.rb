# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item_base, class: Item do
    factory :item do
      no 2222
      name "MyString"
      price "999"
      category_id 1
      color_id 1
      img "2222.jpg"
      explanation "MyText"
    end

    factory :item_valid do
      no 1234
      name "name"
      price "999"
      category_id 1
      color_id 1
      img "1234.jpg"
      explanation "MyText"
    end

    factory :item_search_many do
      sequence(:no) {|n| 1234 + n}
      sequence(:name) {|n| "name#{n}"}
      price "999"
      sequence(:category_id) { |n| n%3 + 1 }
      sequence(:color_id) { |n| n%3 + 1 }
      sequence(:img) {|n| "#{1234 + n}.jpg"}
      explanation "MyText"
    end
  end
end
