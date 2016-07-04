FactoryGirl.define do
  factory :school do
    description Faker::Company.name
    address Faker::Address.city
    phone Faker::Number.number(10)
  end
end
