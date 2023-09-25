# frozen_string_literal: true

class DataList < ApplicationRecord
  has_many :roles, as: :roleable
end
