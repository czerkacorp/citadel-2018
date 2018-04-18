# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180417222809) do

  create_table "account_bans", primary_key: "ban_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "account_id", null: false, unsigned: true
    t.integer "issuer_id", null: false, unsigned: true
    t.timestamp "created", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "expires", null: false
    t.text "reason", limit: 255, null: false
  end

  create_table "account_log", primary_key: "acclog_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "account_id", null: false, unsigned: true
    t.datetime "timestamp", null: false
    t.string "ip_address", limit: 15, null: false
  end

  create_table "accounts", primary_key: "account_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC" do |t|
    t.string "username", limit: 32, null: false
    t.string "password", null: false
    t.integer "station_id", null: false, unsigned: true
    t.timestamp "created", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true, null: false
    t.boolean "admin_level", default: false, null: false
    t.string "salt", limit: 32, null: false
  end

  create_table "badge_areas", primary_key: "uid", id: :boolean, unsigned: true, auto_increment: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.boolean "planet_id", null: false, unsigned: true
    t.float "x", limit: 24, null: false
    t.float "y", limit: 24, null: false
    t.float "z", limit: 24, default: 0.0, null: false
    t.boolean "badge_id", null: false, unsigned: true
    t.index ["planet_id"], name: "SECONDARY"
  end

  create_table "character_bans", primary_key: "ban_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "account_id", null: false, unsigned: true
    t.integer "issuer_id", null: false, unsigned: true
    t.integer "galaxy_id", null: false
    t.text "name", limit: 255, null: false
    t.timestamp "created", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "expires", default: 0, null: false, unsigned: true
    t.text "reason", limit: 255, null: false
  end

  create_table "characters", primary_key: "character_oid", id: :bigint, default: nil, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "account_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "galaxy_id", default: 0, null: false, unsigned: true
    t.string "firstname", limit: 15, default: "", null: false
    t.string "surname", limit: 20
    t.integer "race", limit: 1, default: 0, null: false
    t.boolean "gender", default: false, null: false
    t.text "template", limit: 255, null: false
    t.timestamp "creation_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["account_id"], name: "acc_idx"
  end

  create_table "characters_dirty", primary_key: "character_oid", id: :bigint, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "account_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "galaxy_id", default: 0, null: false, unsigned: true
    t.string "firstname", limit: 15, default: "", null: false
    t.string "surname", limit: 20
    t.integer "race", limit: 1, default: 0, null: false
    t.boolean "gender", default: false, null: false
    t.text "template", limit: 255, null: false
    t.timestamp "creation_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "citadel_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.bigint "account_id"
    t.index ["account_id"], name: "index_citadel_users_on_account_id"
  end

  create_table "deleted_characters", primary_key: "character_oid", id: :bigint, default: nil, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "account_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "galaxy_id", default: 0, null: false, unsigned: true
    t.string "firstname", limit: 15, default: "", null: false
    t.string "surname", limit: 20
    t.integer "race", limit: 1, default: 0, null: false
    t.boolean "gender", default: false, null: false
    t.text "template", limit: 255, null: false
    t.timestamp "creation_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["account_id"], name: "acc_idx"
  end

  create_table "galaxy", primary_key: "galaxy_id", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 50, default: "", null: false
    t.string "address", limit: 100, default: "", null: false
    t.integer "port", default: 0, null: false
    t.integer "pingport"
    t.integer "population", default: 0, null: false
  end

  create_table "galaxy_bans", primary_key: "ban_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "account_id", null: false, unsigned: true
    t.integer "issuer_id", null: false, unsigned: true
    t.integer "galaxy_id", null: false
    t.timestamp "created", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "expires", default: 0, null: false, unsigned: true
    t.text "reason", limit: 255, null: false
  end

  create_table "mantis_bug_file_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "bug_id", default: 0, null: false, unsigned: true
    t.string "title", limit: 250, default: "", null: false
    t.string "description", limit: 250, default: "", null: false
    t.string "diskfile", limit: 250, default: "", null: false
    t.string "filename", limit: 250, default: "", null: false
    t.string "folder", limit: 250, default: "", null: false
    t.integer "filesize", default: 0, null: false
    t.string "file_type", limit: 250, default: "", null: false
    t.datetime "date_added", default: "1970-01-01 00:00:01", null: false
    t.binary "content", limit: 4294967295
    t.index ["bug_id"], name: "idx_bug_file_bug_id"
    t.index ["diskfile"], name: "idx_diskfile"
  end

  create_table "mantis_bug_history_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.integer "bug_id", default: 0, null: false, unsigned: true
    t.datetime "date_modified", default: "1970-01-01 00:00:01", null: false
    t.string "field_name", limit: 64, null: false
    t.string "old_value", null: false
    t.string "new_value", null: false
    t.integer "type", limit: 2, default: 0, null: false
    t.index ["bug_id"], name: "idx_bug_history_bug_id"
    t.index ["user_id"], name: "idx_history_user_id"
  end

  create_table "mantis_bug_monitor_table", primary_key: ["user_id", "bug_id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.integer "bug_id", default: 0, null: false, unsigned: true
  end

  create_table "mantis_bug_relationship_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "source_bug_id", default: 0, null: false, unsigned: true
    t.integer "destination_bug_id", default: 0, null: false, unsigned: true
    t.integer "relationship_type", limit: 2, default: 0, null: false
    t.index ["destination_bug_id"], name: "idx_relationship_destination"
    t.index ["source_bug_id"], name: "idx_relationship_source"
  end

  create_table "mantis_bug_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.integer "reporter_id", default: 0, null: false, unsigned: true
    t.integer "handler_id", default: 0, null: false, unsigned: true
    t.integer "duplicate_id", default: 0, null: false, unsigned: true
    t.integer "priority", limit: 2, default: 30, null: false
    t.integer "severity", limit: 2, default: 50, null: false
    t.integer "reproducibility", limit: 2, default: 10, null: false
    t.integer "status", limit: 2, default: 10, null: false
    t.integer "resolution", limit: 2, default: 10, null: false
    t.integer "projection", limit: 2, default: 10, null: false
    t.string "category", limit: 64, default: "", null: false
    t.datetime "date_submitted", default: "1970-01-01 00:00:01", null: false
    t.datetime "last_updated", default: "1970-01-01 00:00:01", null: false
    t.integer "eta", limit: 2, default: 10, null: false
    t.integer "bug_text_id", default: 0, null: false, unsigned: true
    t.string "os", limit: 32, default: "", null: false
    t.string "os_build", limit: 32, default: "", null: false
    t.string "platform", limit: 32, default: "", null: false
    t.string "version", limit: 64, default: "", null: false
    t.string "fixed_in_version", limit: 64, default: "", null: false
    t.string "build", limit: 32, default: "", null: false
    t.integer "profile_id", default: 0, null: false, unsigned: true
    t.integer "view_state", limit: 2, default: 10, null: false
    t.string "summary", limit: 128, default: "", null: false
    t.integer "sponsorship_total", default: 0, null: false
    t.integer "sticky", limit: 1, default: 0, null: false
    t.string "target_version", limit: 64, default: "", null: false
    t.index ["fixed_in_version"], name: "idx_bug_fixed_in_version"
    t.index ["project_id"], name: "idx_project"
    t.index ["sponsorship_total"], name: "idx_bug_sponsorship_total"
    t.index ["status"], name: "idx_bug_status"
  end

  create_table "mantis_bug_tag_table", primary_key: ["bug_id", "tag_id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "bug_id", default: 0, null: false, unsigned: true
    t.integer "tag_id", default: 0, null: false, unsigned: true
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.datetime "date_attached", default: "1970-01-01 00:00:01", null: false
  end

  create_table "mantis_bug_text_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.text "description", limit: 4294967295, null: false
    t.text "steps_to_reproduce", limit: 4294967295, null: false
    t.text "additional_information", limit: 4294967295, null: false
  end

  create_table "mantis_bugnote_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "bug_id", default: 0, null: false, unsigned: true
    t.integer "reporter_id", default: 0, null: false, unsigned: true
    t.integer "bugnote_text_id", default: 0, null: false, unsigned: true
    t.integer "view_state", limit: 2, default: 10, null: false
    t.datetime "date_submitted", default: "1970-01-01 00:00:01", null: false
    t.datetime "last_modified", default: "1970-01-01 00:00:01", null: false
    t.integer "note_type", default: 0
    t.string "note_attr", limit: 250, default: ""
    t.integer "time_tracking", default: 0, null: false, unsigned: true
    t.index ["bug_id"], name: "idx_bug"
    t.index ["last_modified"], name: "idx_last_mod"
  end

  create_table "mantis_bugnote_text_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.text "note", limit: 4294967295, null: false
  end

  create_table "mantis_config_table", primary_key: ["config_id", "project_id", "user_id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "config_id", limit: 64, null: false
    t.integer "project_id", default: 0, null: false
    t.integer "user_id", default: 0, null: false
    t.integer "access_reqd", default: 0
    t.integer "type", default: 90
    t.text "value", limit: 4294967295, null: false
    t.index ["config_id"], name: "idx_config"
  end

  create_table "mantis_custom_field_project_table", primary_key: ["field_id", "project_id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "field_id", default: 0, null: false
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.integer "sequence", limit: 2, default: 0, null: false
  end

  create_table "mantis_custom_field_string_table", primary_key: ["field_id", "bug_id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "field_id", default: 0, null: false
    t.integer "bug_id", default: 0, null: false
    t.string "value", default: "", null: false
    t.index ["bug_id"], name: "idx_custom_field_bug"
  end

  create_table "mantis_custom_field_table", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 64, default: "", null: false
    t.integer "type", limit: 2, default: 0, null: false
    t.string "possible_values", default: "", null: false
    t.string "default_value", default: "", null: false
    t.string "valid_regexp", default: "", null: false
    t.integer "access_level_r", limit: 2, default: 0, null: false
    t.integer "access_level_rw", limit: 2, default: 0, null: false
    t.integer "length_min", default: 0, null: false
    t.integer "length_max", default: 0, null: false
    t.integer "advanced", limit: 1, default: 0, null: false
    t.integer "require_report", limit: 1, default: 0, null: false
    t.integer "require_update", limit: 1, default: 0, null: false
    t.integer "display_report", limit: 1, default: 1, null: false
    t.integer "display_update", limit: 1, default: 1, null: false
    t.integer "require_resolved", limit: 1, default: 0, null: false
    t.integer "display_resolved", limit: 1, default: 0, null: false
    t.integer "display_closed", limit: 1, default: 0, null: false
    t.integer "require_closed", limit: 1, default: 0, null: false
    t.index ["name"], name: "idx_custom_field_name"
  end

  create_table "mantis_email_table", primary_key: "email_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "email", limit: 64, default: "", null: false
    t.string "subject", limit: 250, default: "", null: false
    t.datetime "submitted", default: "1970-01-01 00:00:01", null: false
    t.text "metadata", limit: 4294967295, null: false
    t.text "body", limit: 4294967295, null: false
    t.index ["email_id"], name: "idx_email_id"
  end

  create_table "mantis_filters_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", default: 0, null: false
    t.integer "project_id", default: 0, null: false
    t.integer "is_public", limit: 1
    t.string "name", limit: 64, default: "", null: false
    t.text "filter_string", limit: 4294967295, null: false
  end

  create_table "mantis_news_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.integer "poster_id", default: 0, null: false, unsigned: true
    t.datetime "date_posted", default: "1970-01-01 00:00:01", null: false
    t.datetime "last_modified", default: "1970-01-01 00:00:01", null: false
    t.integer "view_state", limit: 2, default: 10, null: false
    t.integer "announcement", limit: 1, default: 0, null: false
    t.string "headline", limit: 64, default: "", null: false
    t.text "body", limit: 4294967295, null: false
  end

  create_table "mantis_project_category_table", primary_key: ["project_id", "category"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.string "category", limit: 64, default: "", null: false
    t.integer "user_id", default: 0, null: false, unsigned: true
  end

  create_table "mantis_project_file_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.string "title", limit: 250, default: "", null: false
    t.string "description", limit: 250, default: "", null: false
    t.string "diskfile", limit: 250, default: "", null: false
    t.string "filename", limit: 250, default: "", null: false
    t.string "folder", limit: 250, default: "", null: false
    t.integer "filesize", default: 0, null: false
    t.string "file_type", limit: 250, default: "", null: false
    t.datetime "date_added", default: "1970-01-01 00:00:01", null: false
    t.binary "content", limit: 4294967295
  end

  create_table "mantis_project_hierarchy_table", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "child_id", null: false, unsigned: true
    t.integer "parent_id", null: false, unsigned: true
  end

  create_table "mantis_project_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 128, default: "", null: false
    t.integer "status", limit: 2, default: 10, null: false
    t.integer "enabled", limit: 1, default: 1, null: false
    t.integer "view_state", limit: 2, default: 10, null: false
    t.integer "access_min", limit: 2, default: 10, null: false
    t.string "file_path", limit: 250, default: "", null: false
    t.text "description", limit: 4294967295, null: false
    t.index ["id"], name: "idx_project_id"
    t.index ["name"], name: "idx_project_name", unique: true
    t.index ["view_state"], name: "idx_project_view"
  end

  create_table "mantis_project_user_list_table", primary_key: ["project_id", "user_id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.integer "access_level", limit: 2, default: 10, null: false
    t.index ["user_id"], name: "idx_project_user"
  end

  create_table "mantis_project_version_table", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.string "version", limit: 64, default: "", null: false
    t.datetime "date_order", default: "1970-01-01 00:00:01", null: false
    t.text "description", limit: 4294967295, null: false
    t.integer "released", limit: 1, default: 1, null: false
    t.index ["project_id", "version"], name: "idx_project_version", unique: true
  end

  create_table "mantis_sponsorship_table", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "bug_id", default: 0, null: false
    t.integer "user_id", default: 0, null: false
    t.integer "amount", default: 0, null: false
    t.string "logo", limit: 128, default: "", null: false
    t.string "url", limit: 128, default: "", null: false
    t.integer "paid", limit: 1, default: 0, null: false
    t.datetime "date_submitted", default: "1970-01-01 00:00:01", null: false
    t.datetime "last_updated", default: "1970-01-01 00:00:01", null: false
    t.index ["bug_id"], name: "idx_sponsorship_bug_id"
    t.index ["user_id"], name: "idx_sponsorship_user_id"
  end

  create_table "mantis_tag_table", primary_key: ["id", "name"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "id", null: false, unsigned: true, auto_increment: true
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.string "name", limit: 100, default: "", null: false
    t.text "description", limit: 4294967295, null: false
    t.datetime "date_created", default: "1970-01-01 00:00:01", null: false
    t.datetime "date_updated", default: "1970-01-01 00:00:01", null: false
  end

  create_table "mantis_tokens_table", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "owner", null: false
    t.integer "type", null: false
    t.datetime "timestamp", null: false
    t.datetime "expiry"
    t.text "value", limit: 4294967295, null: false
    t.index ["type", "owner"], name: "idx_typeowner"
  end

  create_table "mantis_user_pref_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.integer "project_id", default: 0, null: false, unsigned: true
    t.integer "default_profile", default: 0, null: false, unsigned: true
    t.integer "default_project", default: 0, null: false, unsigned: true
    t.integer "advanced_report", limit: 1, default: 0, null: false
    t.integer "advanced_view", limit: 1, default: 0, null: false
    t.integer "advanced_update", limit: 1, default: 0, null: false
    t.integer "refresh_delay", default: 0, null: false
    t.integer "redirect_delay", limit: 1, default: 0, null: false
    t.string "bugnote_order", limit: 4, default: "ASC", null: false
    t.integer "email_on_new", limit: 1, default: 0, null: false
    t.integer "email_on_assigned", limit: 1, default: 0, null: false
    t.integer "email_on_feedback", limit: 1, default: 0, null: false
    t.integer "email_on_resolved", limit: 1, default: 0, null: false
    t.integer "email_on_closed", limit: 1, default: 0, null: false
    t.integer "email_on_reopened", limit: 1, default: 0, null: false
    t.integer "email_on_bugnote", limit: 1, default: 0, null: false
    t.integer "email_on_status", limit: 1, default: 0, null: false
    t.integer "email_on_priority", limit: 1, default: 0, null: false
    t.integer "email_on_priority_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_status_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_bugnote_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_reopened_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_closed_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_resolved_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_feedback_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_assigned_min_severity", limit: 2, default: 10, null: false
    t.integer "email_on_new_min_severity", limit: 2, default: 10, null: false
    t.integer "email_bugnote_limit", limit: 2, default: 0, null: false
    t.string "language", limit: 32, default: "english", null: false
  end

  create_table "mantis_user_print_pref_table", primary_key: "user_id", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "print_pref", limit: 64, null: false
  end

  create_table "mantis_user_profile_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id", default: 0, null: false, unsigned: true
    t.string "platform", limit: 32, default: "", null: false
    t.string "os", limit: 32, default: "", null: false
    t.string "os_build", limit: 32, default: "", null: false
    t.text "description", limit: 4294967295, null: false
  end

  create_table "mantis_user_table", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "username", limit: 32, default: "", null: false
    t.string "realname", limit: 64, default: "", null: false
    t.string "email", limit: 64, default: "", null: false
    t.string "password", limit: 32, default: "", null: false
    t.datetime "date_created", default: "1970-01-01 00:00:01", null: false
    t.datetime "last_visit", default: "1970-01-01 00:00:01", null: false
    t.integer "enabled", limit: 1, default: 1, null: false
    t.integer "protected", limit: 1, default: 0, null: false
    t.integer "access_level", limit: 2, default: 10, null: false
    t.integer "login_count", default: 0, null: false
    t.integer "lost_password_request_count", limit: 2, default: 0, null: false
    t.integer "failed_login_count", limit: 2, default: 0, null: false
    t.string "cookie_string", limit: 64, default: "", null: false
    t.index ["access_level"], name: "idx_access"
    t.index ["cookie_string"], name: "idx_user_cookie_string", unique: true
    t.index ["enabled"], name: "idx_enable"
    t.index ["username"], name: "idx_user_username", unique: true
  end

  create_table "mission_manager_hunt_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "zoneid", null: false
    t.string "file1", limit: 100, null: false
    t.string "file2", limit: 100
    t.integer "level", null: false
  end

  create_table "mission_manager_informants", id: :integer, limit: 2, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "planet", limit: 2, default: 0, null: false
    t.bigint "cell", default: 0, null: false
    t.float "X", limit: 53, default: 0.0, null: false
    t.float "Y", limit: 53, default: 0.0, null: false
    t.float "Z", limit: 53, default: 0.0, null: false
    t.float "oY", limit: 53, default: 0.0, null: false
    t.float "oW", limit: 53, default: 0.0, null: false
    t.integer "level", limit: 2, default: 0, null: false
  end

  create_table "mission_manager_npcs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "zoneid"
    t.bigint "parentid", default: 0
    t.string "file", limit: 200
    t.float "oX", limit: 24, default: 0.0
    t.float "oY", limit: 24, default: 0.0
    t.float "oZ", limit: 24, default: 0.0
    t.float "oW", limit: 24, default: 1.0
    t.float "x", limit: 24
    t.float "z", limit: 24
    t.float "y", limit: 24
    t.integer "level", default: 10
    t.string "mood_animation", limit: 45
    t.integer "creature_bitmask", default: 0, unsigned: true
    t.index ["id"], name: "idworldserverspawns_UNIQUE", unique: true
  end

  create_table "mission_manager_recon_locs", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "zoneid", limit: 1, null: false
    t.string "template_file", limit: 200, null: false
    t.integer "template_type", null: false
    t.float "oX", limit: 24, null: false
    t.float "oY", limit: 24, null: false
    t.float "oZ", limit: 24, null: false
    t.float "oW", limit: 24, null: false
    t.float "X", limit: 24, null: false
    t.float "Z", limit: 24, null: false
    t.float "Y", limit: 24, null: false
    t.index ["template_file"], name: "file_ix", type: :fulltext
    t.index ["zoneid"], name: "zone_id"
  end

  create_table "mission_manager_spawn_bounty", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "file", limit: 250, null: false
  end

  create_table "mission_manager_spawn_lairs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "template", limit: 250
    t.string "planets", limit: 45, default: "-1"
    t.string "level_range", limit: 45, default: "5-10"
  end

  create_table "no_build_zones", primary_key: "nbz_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "planet_id", default: 0, null: false
    t.string "zone_name", default: "region_name"
    t.string "zone_file", default: "region_file"
    t.string "zone_type"
    t.float "x", limit: 24, default: 0.0, null: false
    t.float "z", limit: 24, default: 0.0, null: false
    t.float "radius", limit: 24, default: 0.0, null: false
  end

  create_table "performance", primary_key: "ix", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "performanceName", limit: 11
    t.integer "instrumentAudioId", unsigned: true
    t.string "requiredSong", limit: 21
    t.string "requiredInstrument", limit: 11
    t.string "requiredDance", limit: 22
    t.integer "danceVisualId", unsigned: true
    t.integer "actionPointsPerLoop", unsigned: true
    t.float "loopDuration", limit: 24
    t.integer "type"
    t.integer "baseXp", unsigned: true
    t.integer "flourishXpMod", unsigned: true
    t.integer "healMindWound", unsigned: true
    t.integer "healShockWound", unsigned: true
    t.string "requiredSkillMod", limit: 21
    t.integer "requiredSkillModValue", unsigned: true
    t.string "mainloop", limit: 40
    t.string "flourish1", limit: 46
    t.string "flourish2", limit: 46
    t.string "flourish3", limit: 46
    t.string "flourish4", limit: 46
    t.string "flourish5", limit: 46
    t.string "flourish6", limit: 46
    t.string "flourish7", limit: 46
    t.string "flourish8", limit: 46
    t.string "intro", limit: 41
    t.string "outro", limit: 41
    t.index ["danceVisualId"], name: "iDance_ix"
    t.index ["instrumentAudioId"], name: "iAudio_ix"
  end

  create_table "performance_perform_effect", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "effectName", limit: 14
    t.string "performanceType", limit: 11
    t.integer "requiredSkillModValue", unsigned: true
    t.boolean "requiredPerforming"
    t.string "targetType", limit: 10
    t.float "effectDuration", limit: 24
    t.integer "effectActionCost", unsigned: true
  end

  create_table "performance_performance", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "performanceName", limit: 11
    t.integer "instrumentAudioId", unsigned: true
    t.string "requiredSong", limit: 21
    t.string "requiredInstrument", limit: 11
    t.string "requiredDance", limit: 22
    t.integer "danceVisualId", unsigned: true
    t.integer "actionPointsPerLoop", unsigned: true
    t.float "loopDuration", limit: 24
    t.integer "type"
    t.integer "baseXp", unsigned: true
    t.integer "flourishXpMod", unsigned: true
    t.integer "healMindWound", unsigned: true
    t.integer "healShockWound", unsigned: true
    t.string "requiredSkillMod", limit: 21
    t.integer "requiredSkillModValue", unsigned: true
    t.string "mainloop", limit: 40
    t.string "flourish1", limit: 46
    t.string "flourish2", limit: 46
    t.string "flourish3", limit: 46
    t.string "flourish4", limit: 46
    t.string "flourish5", limit: 46
    t.string "flourish6", limit: 46
    t.string "flourish7", limit: 46
    t.string "flourish8", limit: 46
    t.string "intro", limit: 41
    t.string "outro", limit: 41
  end

  create_table "sessions", primary_key: "account_id", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "session_id", null: false, unsigned: true
    t.string "ip", limit: 15, null: false
    t.datetime "expires", null: false
  end

  create_table "skills", primary_key: "skill_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "skill_name", limit: 52
    t.string "skill_parent", limit: 52
    t.string "skill_graph_type", limit: 10
    t.boolean "skill_god_only"
    t.boolean "skill_is_title"
    t.boolean "skill_is_profession"
    t.boolean "skill_is_hidden"
    t.integer "skill_money_required", unsigned: true
    t.integer "skill_points_required", unsigned: true
    t.integer "skill_requirements_count", unsigned: true
    t.string "skill_requirements", limit: 201
    t.string "skill_preclusions", limit: 50
    t.string "skill_xp_type", limit: 40
    t.integer "skill_xp_cost", unsigned: true
    t.integer "skill_xp_cap", unsigned: true
    t.string "skill_required_missions", limit: 1
    t.integer "skill_apprenticeships_required", unsigned: true
    t.string "skill_stats_required", limit: 1
    t.string "skill_species_required", limit: 56
    t.string "skill_jedi_state_required", limit: 16
    t.string "skill_abilities", limit: 1
    t.text "skill_commands"
    t.text "skill_mods"
    t.string "skill_schematics_granted", limit: 123
    t.string "skill_schematics_revoked", limit: 1
    t.boolean "skill_is_searchable"
    t.integer "skill_ender", unsigned: true
    t.index ["skill_id"], name: "skill_id", unique: true
  end

  create_table "statictangibleobjects", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.integer "zoneid", limit: 1, null: false
    t.bigint "parentid", null: false
    t.string "name", null: false
    t.string "template_file", limit: 200, null: false
    t.integer "template_type", null: false
    t.string "template_name", null: false
    t.float "oX", limit: 24, null: false
    t.float "oY", limit: 24, null: false
    t.float "oZ", limit: 24, null: false
    t.float "oW", limit: 24, null: false
    t.float "X", limit: 24, null: false
    t.float "Z", limit: 24, null: false
    t.float "Y", limit: 24, null: false
    t.index ["template_file"], name: "file_ix", type: :fulltext
    t.index ["zoneid"], name: "zone_id"
  end

  create_table "trainers", primary_key: "pix", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.string "Location", limit: 64
    t.string "Trainer Name", limit: 64
    t.string "Trainer Type", limit: 64
    t.string "Profession", limit: 64, null: false
    t.string "CRC1", limit: 16
    t.string "CRC2", limit: 16
    t.string "CRC3", limit: 16
    t.integer "Planet", limit: 2
    t.bigint "Cell", default: 0
    t.float "WorldX", limit: 53, default: 0.0
    t.float "WorldY", limit: 53, default: 0.0
    t.float "WorldZ", limit: 53, default: 0.0
    t.float "CellX", limit: 53, default: 0.0
    t.float "CellY", limit: 53, default: 0.0
    t.float "CellZ", limit: 53, default: 0.0
    t.float "oY", limit: 53, default: 0.0
    t.float "oW", limit: 53, default: 0.0
    t.boolean "planetmapid", default: false, null: false, unsigned: true
    t.index ["pix"], name: "pix"
  end

  create_table "world_server_static_spawns", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "zoneid"
    t.bigint "parentid", default: 0
    t.string "file", limit: 200
    t.float "oX", limit: 24, default: 0.0
    t.float "oY", limit: 24, default: 0.0
    t.float "oZ", limit: 24, default: 0.0
    t.float "oW", limit: 24, default: 1.0
    t.float "x", limit: 24
    t.float "z", limit: 24
    t.float "y", limit: 24
    t.integer "level", default: 10
    t.string "mood_animation", limit: 45
    t.integer "creature_bitmask", default: 0, unsigned: true
    t.integer "combat_flags", default: 0, unsigned: true
    t.float "respawn_timer", limit: 24, default: 0.0
    t.index ["id"], name: "idworldserverspawns_UNIQUE", unique: true
  end

end
