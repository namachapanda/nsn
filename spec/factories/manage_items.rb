# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :manage_item, :class => 'Manage::Item' do
    no 1
  end
end
