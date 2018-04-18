class MissionSpawnLairsTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE mission_manager_spawn_lairs (
        id            int(11)       NOT NULL AUTO_INCREMENT,
        template      varchar(250)  DEFAULT NULL,
        planets       varchar(45)   DEFAULT '-1',
        level_range   varchar(45)   DEFAULT '5-10',
        PRIMARY KEY (id)
      ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/mm_spawn_lairs_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE mission_manager_spawn_lairs;
    SQL
    execute query
  end
end
