class MissionNpcsTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE mission_manager_npcs (
        id                int(11)       NOT NULL AUTO_INCREMENT,
        zoneid            int(11)       DEFAULT NULL,
        parentid          bigint(20)    DEFAULT 0,
        file              varchar(200)  DEFAULT NULL,
        oX                float         DEFAULT 0,
        oY                float         DEFAULT 0,
        oZ                float         DEFAULT 0,
        oW                float         DEFAULT 1,
        x                 float         DEFAULT NULL,
        z                 float         DEFAULT NULL,
        y                 float         DEFAULT NULL,
        level             int(11)       DEFAULT 10,
        mood_animation    varchar(45)   DEFAULT NULL,
        creature_bitmask  int(10)       unsigned DEFAULT 0,
        PRIMARY KEY (id)
      ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/mm_npc_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE mission_manager_npcs;
    SQL
    execute query
  end
end
