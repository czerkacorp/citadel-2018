class MissionHuntTypesTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE mission_manager_hunt_types (
        id      int(11)       NOT NULL AUTO_INCREMENT,
        zoneid  int(11)       NOT NULL,
        file1   varchar(100)  NOT NULL,
        file2   varchar(100)  DEFAULT NULL,
        level   int(11)       NOT NULL,
        PRIMARY KEY (id)
      ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/mm_hunt_type_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE mission_manager_hunt_types;
    SQL
    execute query
  end
end
