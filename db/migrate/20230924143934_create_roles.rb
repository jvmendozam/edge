class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles, id: :uuid do |t|
      t.uuid :sort_id
      t.references :roleable, polymorphic: true, type: :uuid, index: true

      t.timestamps
    end

    add_reference :roles, :role_name, foreign_key: true, type: :uuid
  end
end
