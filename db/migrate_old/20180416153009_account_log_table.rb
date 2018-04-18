class AccountLogTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE account_log (
        acclog_id             int(10)         unsigned NOT NULL AUTO_INCREMENT,
        account_id            int(10)         unsigned NOT NULL,
        timestamp             datetime        NOT NULL,
        ip_address            varchar(15)     NOT NULL,
        PRIMARY KEY (acclog_id),
        FOREIGN KEY (account_id) REFERENCES accounts(account_id)
      ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
    SQL
    execute query
  end

  def down
    query = <<-SQL
      DROP TABLE account_log;
    SQL
    execute query
  end
end
