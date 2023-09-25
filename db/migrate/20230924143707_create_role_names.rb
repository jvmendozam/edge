class CreateRoleNames < ActiveRecord::Migration[7.0]
  def change
    create_table :role_names, id: :uuid do |t|
      t.string :role_name_key
      t.string :short_name
      t.string :name

      t.timestamps
    end
  end
end
