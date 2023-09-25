# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should belong_to(:role_name) }

  it 'have one role_name' do
    role = FactoryBot.create(:role)
    expect(role.role_name).to be_a(RoleName)
  end
end
