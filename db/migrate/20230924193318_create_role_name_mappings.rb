class CreateRoleNameMappings < ActiveRecord::Migration[7.0]
  def change
    create_table :role_name_mappings do |t|
      t.string :role_key, null: false
      t.string :short_name, null: false
      t.string :name, null: false
      t.uuid :company_id
      t.timestamps null: false
      t.uuid :sort_id
    end

    add_index :role_name_mappings, %i[company_id role_key], unique: true,
                                                            name: 'index_role_name_mappings_on_company_id_and_role_key'
    add_index :role_name_mappings, :company_id, name: 'index_role_name_mappings_on_company_id'
  end
end
