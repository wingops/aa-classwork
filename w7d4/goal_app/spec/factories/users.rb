FactoryBot.define do
  factory :user do
    username { Faker::Movies::HarryPotter.character }
    password { '123456'}
    
  end
end
