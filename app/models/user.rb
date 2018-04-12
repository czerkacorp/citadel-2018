class User < ActiveRecord::Base
  self.table_name = 'accounts'
  validates :username, uniqueness: true
  attribute :admin_level, :integer, :limit => 1
end
