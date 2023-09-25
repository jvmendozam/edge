# frozen_string_literal: true

require 'rails_helper'

describe 'task 20230924202848_migrate_role_data.rake', type: :task do
  subject(:after_party) { Rake::Task['after_party:migrate_role_data'].execute }

  let(:role_name_mapping) { FactoryBot.create_list(:role_name_mapping, 10) }
  before :each do
    Rake::Task.define_task(:environment)

    role_name_mapping
    # Delete items created by current relationships.
    Role.all.delete_all
    RoleName.all.delete_all
  end

  it "doesn't raise any errors" do
    expect { after_party }.not_to raise_error
  end

  it 'migrate data' do
    FactoryBot.create(:role_name)

    after_party
    roles = Role.all
    expect(role_name_mapping.first.role_key).to eq(roles.first.role_name.role_name_key)
    expect(role_name_mapping.pluck(:company_id)).to match_array(roles.pluck(:roleable_id))
  end
end
