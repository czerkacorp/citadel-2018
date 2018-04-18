class CharacterBansTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE  character_bans (
        ban_id                int(10)         unsigned NOT NULL AUTO_INCREMENT,
        account_id            int(10)         unsigned NOT NULL,
        issuer_id             int(10)         unsigned NOT NULL,
        galaxy_id             int(5)          unsigned NOT NULL,
        name                  tinytext        NOT NULL,
        created               timestamp       NOT NULL DEFAULT CURRENT_TIMESTAMP,
        expires               int(10)         unsigned NOT NULL DEFAULT 0,
        reason                tinytext        NOT NULL,
        PRIMARY KEY (ban_id) USING BTREE,
        FOREIGN KEY (account_id) REFERENCES accounts(account_id),
        FOREIGN KEY (issuer_id) REFERENCES accounts(account_id),
        FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
      ) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
    SQL
    execute query
  end

  def down
    query = <<-SQL
      DROP TABLE character_bans;
    SQL
    execute query
  end
end
