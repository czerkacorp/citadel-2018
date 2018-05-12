class FixCitadelSettingsTable < ActiveRecord::Migration[5.1]
  def up
    rename_table :settings, :citadel_settings
  end

  def down
    rename_table :citadel_settings, :settings
  end
end
