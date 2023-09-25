# frozen_string_literal: true

class Company < ApplicationRecord
  has_one :role, as: :roleable
end
