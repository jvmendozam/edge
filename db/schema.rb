# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_924_232_524) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'companies', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'data_list_role_name_mappings', force: :cascade do |t|
    t.string 'role_key', null: false
    t.string 'short_name', null: false
    t.string 'name', null: false
    t.uuid 'sort_id'
    t.uuid 'data_list_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[data_list_id role_key], name: 'index_data_list_role_name_mappings_on_data_list_id_and_role_key',
                                       unique: true
    t.index ['data_list_id'], name: 'index_data_list_role_name_mappings_on_data_list_id'
  end

  create_table 'data_lists', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'role_name_mappings', force: :cascade do |t|
    t.string 'role_key', null: false
    t.string 'short_name', null: false
    t.string 'name', null: false
    t.uuid 'company_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'sort_id'
    t.index %w[company_id role_key], name: 'index_role_name_mappings_on_company_id_and_role_key', unique: true
    t.index ['company_id'], name: 'index_role_name_mappings_on_company_id'
  end

  create_table 'role_names', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'role_name_key'
    t.string 'short_name'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'roles', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'sort_id'
    t.string 'roleable_type'
    t.uuid 'roleable_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'role_name_id'
    t.index ['role_name_id'], name: 'index_roles_on_role_name_id'
    t.index %w[roleable_type roleable_id], name: 'index_roles_on_roleable'
  end

  create_table 'task_records', id: false, force: :cascade do |t|
    t.string 'version', null: false
  end

  add_foreign_key 'roles', 'role_names'
end
