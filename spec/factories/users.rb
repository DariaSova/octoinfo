FactoryGirl.define do
  factory :user do
    sequence(:name) { |x| "Pooh#{x}" }
    sequence(:uid) { |x| "#{x}" }
    provider 'github'
  end
end
