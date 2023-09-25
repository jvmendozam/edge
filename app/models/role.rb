# frozen_string_literal: true

class Role < ApplicationRecord
  belongs_to :roleable, polymorphic: true
  belongs_to :role_name

  delegate :short_name, to: :role_name
  delegate :name, to: :role_name
end
