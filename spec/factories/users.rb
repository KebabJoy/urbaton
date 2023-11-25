FactoryBot.define do
  factory :client do
    sequence(:email) { |n| "new_email_#{n}@example.com" }
    first_name { Faker::Games::Minecraft.biome }
    last_name { Faker::Games::Minecraft.biome }
    middle_name { Faker::Games::Minecraft.biome }
    sequence(:phone) { |n| "8800555353#{n}" }
    auth_token { SecureRandom.uuid }
    password { SecureRandom.uuid }
  end

  factory :admin do
    sequence(:email) { |n| "admin_email_#{n}@example.com" }
    first_name { Faker::Games::Minecraft.biome }
    last_name { Faker::Games::Minecraft.biome }
    middle_name { Faker::Games::Minecraft.biome }
    sequence(:phone) { |n| "8800555353#{n}" }
    password { SecureRandom.uuid }
    auth_token { SecureRandom.uuid }
  end

  factory :manager do
    sequence(:email) { |n| "manager_email_#{n}@example.com" }
    first_name { Faker::Games::Minecraft.biome }
    last_name { Faker::Games::Minecraft.biome }
    middle_name { Faker::Games::Minecraft.biome }
    sequence(:phone) { |n| "8800555353#{n}" }
    password { SecureRandom.uuid }
    auth_token { SecureRandom.uuid }
  end
end
