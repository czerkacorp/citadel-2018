class SwgEmuBaseSchema < ActiveRecord::Migration[5.1]
  def self.up
    ActiveRecord::Schema.define(version: 0) do

      create_table "account_bans", primary_key: "ban_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
        t.integer "account_id", null: false, unsigned: true
        t.integer "issuer_id", null: false, unsigned: true
        t.timestamp "created", default: -> { "CURRENT_TIMESTAMP" }, null: false
        t.timestamp "expires", null: false
        t.text "reason", limit: 255, null: false
      end
    
      create_table "account_ips", primary_key: "idaccount_ips", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
        t.integer "account_id", null: false, unsigned: true
        t.string "ip", limit: 45, null: false
        t.timestamp "timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
        t.integer "logout", limit: 1, default: 0, null: false
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
    
      create_table "deleted_characters", primary_key: "character_oid", id: :bigint, default: nil, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
        t.integer "account_id", limit: 3, default: 0, null: false, unsigned: true
        t.integer "galaxy_id", default: 0, null: false, unsigned: true
        t.string "firstname", limit: 15, default: "", null: false
        t.string "surname", limit: 20
        t.integer "race", limit: 1, default: 0, null: false
        t.boolean "gender", default: false, null: false
        t.text "template", limit: 255, null: false
        t.timestamp "creation_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
        t.boolean "db_deleted", default: false, null: false
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
  end
end
