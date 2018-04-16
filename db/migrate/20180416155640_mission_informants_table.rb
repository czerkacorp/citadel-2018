class MissionInformantsTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE mission_manager_informants (
        id      smallint(6)   NOT NULL AUTO_INCREMENT,
        planet  smallint(6)   NOT NULL DEFAULT 0,
        cell    bigint(20)    NOT NULL DEFAULT 0,
        X       double        NOT NULL DEFAULT 0,
        Y       double        NOT NULL DEFAULT 0,
        Z       double        NOT NULL DEFAULT 0,
        oY      double        NOT NULL DEFAULT 0,
        oW      double        NOT NULL DEFAULT 0,
        level   smallint(6)   NOT NULL DEFAULT 0,
        PRIMARY KEY (id)
      ) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/mm_informant_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE mission_manager_informants;
    SQL
    execute query
  end
end
