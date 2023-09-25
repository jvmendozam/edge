# frozen_string_literal: true

FactoryBot.define do
  factory :role_name_mapping do
    role_key { 'top_management' }
    short_name { 'Short Name' }
    name { Faker::Name.name }
    after(:build) do |role_name_mapping|
      role_name_mapping.company ||= FactoryBot.build(:company)
    end
  end
end
