class SessionsTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE sessions (
        account_id            int(10)       unsigned NOT NULL DEFAULT 0,
        session_id            int(10)       unsigned NOT NULL,
        ip                    varchar(15)   NOT NULL,
        expires               datetime      NOT NULL,
        PRIMARY KEY (account_id) USING BTREE
      ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
    SQL
    execute query
  end

  def down
    query = <<-SQL
      DROP TABLE sessions;
    SQL
    execute query
  end
end
