# frozen_string_literal: true

namespace :after_party do
  desc 'Deployment task: create_role_name'
  task create_role_names: :environment do
    puts "Running deploy task 'create_role_names'"
    role_data = [
      { role_name_key: 'top_management:', short_name: ' Top Admin', name: 'Top Administrator' },
      { role_name_key: 'upper_management', short_name: 'Upper Admin', name: 'Upper Administrator' },
      { role_name_key: 'middle_management', short_name: 'Middle Admin', name: 'Middle Administrator' },
      { role_name_key: 'junior_management', short_name: 'Junior Admin', name: 'Junior Administrator' },
      { role_name_key: 'operational_management', short_name: 'Op Admin', name: 'Operational Management' }
    ]

    RoleName.create!(role_data)

    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
