# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Company.name }

    after(:build) do |company|
      company.role ||= FactoryBot.build(:role, roleable_type: 'Company', roleable_id: company.id)
    end
  end
end
