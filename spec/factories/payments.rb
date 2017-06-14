FactoryGirl.define do
  factory :payment do
    donation nil
    gateway_ref "MyString"
    state "MyString"
    amount "9.99"
  end
end
