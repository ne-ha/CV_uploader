FactoryGirl.define do 
  factory :user do 
    email "test@example.com"
    password "aaaaaaaa"
    password_confirmation "aaaaaaaa"
    confirmed_at Time.now
  end
end