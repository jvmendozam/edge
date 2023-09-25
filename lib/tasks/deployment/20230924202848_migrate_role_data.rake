# frozen_string_literal: true

namespace :after_party do
  desc 'Deployment task: migrate_role_data'
  task migrate_role_data: :environment do
    puts "Running deploy task 'migrate_role_data'"

    ActiveRecord::Base.transaction do
      sql = <<~SQL
        INSERT INTO roles (sort_id, roleable_id, roleable_type, role_name_id, created_at, updated_at)
        SELECT rlm.sort_id, rlm.company_id, 'Company', rn.id, rlm.created_at, rlm.updated_at#{' '}
        FROM role_name_mappings rlm
        INNER JOIN role_names rn ON rlm.role_key = rn.role_name_key;
      SQL
      ActiveRecord::Base.connection.execute(sql)

      sql2 = <<~SQL
        INSERT INTO roles (sort_id, roleable_id, roleable_type, role_name_id, created_at, updated_at)
        SELECT dlrn.sort_id, dlrn.data_list_id, 'DataList', rn.id, dlrn.created_at, dlrn.updated_at#{' '}
        FROM data_list_role_name_mappings dlrn
        INNER JOIN role_names rn ON dlrn.role_key = rn.role_name_key;
      SQL
      ActiveRecord::Base.connection.execute(sql2)
    end
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
