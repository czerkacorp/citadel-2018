class AccountsTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE accounts (
        account_id            int(10)         unsigned NOT NULL AUTO_INCREMENT,
        username              varchar(32)     NOT NULL,
        password              varchar(255)    NOT NULL,
        station_id            int(10)         unsigned NOT NULL,
        created               timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
        active                tinyint(1)      NOT NULL DEFAULT 0,
        admin_level           tinyint(1)      NOT NULL DEFAULT 0,
        salt                  varchar(32)     NOT NULL,
        display_name          varchar(50)     NOT NULL,
        email                 varchar(100)    NOT NULL,
        PRIMARY KEY (account_id) USING BTREE
      ) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
    SQL
    execute query
  end

  def down
    query = <<-SQL
      DROP TABLE accounts;
    SQL
    execute query
  end
end
