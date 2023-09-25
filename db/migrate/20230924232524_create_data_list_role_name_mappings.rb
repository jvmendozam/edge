class CreateDataListRoleNameMappings < ActiveRecord::Migration[7.0]
  def change
    create_table :data_list_role_name_mappings do |t|
      t.string :role_key, null: false
      t.string :short_name, null: false
      t.string :name, null: false
      t.uuid :sort_id
      t.uuid :data_list_id
      t.timestamps null: false
    end

    add_index :data_list_role_name_mappings, %i[data_list_id role_key], unique: true,
                                                                        name: 'index_data_list_role_name_mappings_on_data_list_id_and_role_key'
    add_index :data_list_role_name_mappings, :data_list_id, name: 'index_data_list_role_name_mappings_on_data_list_id'
  end
end
