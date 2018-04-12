class User < ActiveRecord::Base
  self.table_name = "accounts"
  attribute :admin_level, :integer, :limit => 1
end
