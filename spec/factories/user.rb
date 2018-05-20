require 'factory_bot'

FactoryBot.define do
  factory :user do
    email "test@email.com"
    password "password"
    full_name "Full Name"
    username "userurl"
  end
end
