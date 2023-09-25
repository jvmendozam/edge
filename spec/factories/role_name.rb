# frozen_string_literal: true

FactoryBot.define do
  factory :role_name do
    role_name_key { 'top_management' }
    short_name { 'Top Admin' }
    name { 'Top Administrator' }

    trait :op_admin do
      role_name_key { 'operational_management' }
      short_name { 'Op Admin' }
      name { 'Operational Management' }
    end
  end
end
