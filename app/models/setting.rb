# RailsSettings Model
class Setting < RailsSettings::Base
  self.table_name = "citadel_settings"
  source Rails.root.join("config/app.yml")
  namespace Rails.env
end
