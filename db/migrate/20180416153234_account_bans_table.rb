class AccountBansTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE account_bans (
        ban_id                int(10)         unsigned NOT NULL AUTO_INCREMENT,
        account_id            int(10)         unsigned NOT NULL,
        issuer_id             int(10)         unsigned NOT NULL,
        created               timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
        expires               timestamp       NOT NULL DEFAULT '0000-00-00 00:00:00',
        reason                tinytext        NOT NULL,
        PRIMARY KEY (ban_id) USING BTREE,
        FOREIGN KEY (account_id) REFERENCES accounts(account_id),
        FOREIGN KEY (issuer_id) REFERENCES accounts(account_id)
      ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
    SQL
    execute query
  end

  def down
    query = <<-SQL
      DROP TABLE account_bans;
    SQL
    execute query
  end
end
