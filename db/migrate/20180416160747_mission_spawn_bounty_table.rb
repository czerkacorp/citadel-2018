class MissionSpawnBountyTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE mission_manager_spawn_bounty (
        id      int(11)       NOT NULL AUTO_INCREMENT,
        file    varchar(250)  NOT NULL,
        PRIMARY KEY (id)
      ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/mm_spawn_bounty_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE mission_manager_spawn_bounty;
    SQL
    execute query
  end
end
