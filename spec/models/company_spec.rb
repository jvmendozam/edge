# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'have one role' do
    company = FactoryBot.create(:company)
    expect(company.role).to be_a(Role)
  end
end
