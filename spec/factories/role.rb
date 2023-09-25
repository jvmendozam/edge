# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    sort_id { SecureRandom.uuid }
    association :role_name, factory: :role_name
    association :roleable, factory: :company
  end
end
