FactoryGirl.define do
  factory :people do
    names Faker::Name.name
    last_names Faker::Name.name
    ci Faker::Number.number(9)
    place_birth Faker::Address.street_name 
    birth Faker::Date.backward(260)
    address Faker::Address.city
    sex "hombre"
  end
end
