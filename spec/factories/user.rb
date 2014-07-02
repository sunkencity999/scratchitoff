FactoryGirl.define do 
  factory :user do 
    name "Dude who Posts"
    email "blahblah@blah.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now 
  end
end
