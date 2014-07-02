
FactoryGirl.define do 
  factory :post do 
    title "First Post"
    body "This is a test post factory"
    user
    list
  end
end    