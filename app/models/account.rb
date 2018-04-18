class Account < ActiveRecord::Base
  attribute :admin_level, :integer, :limit => 1
end
