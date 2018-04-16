class NoBuildZonesTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE  no_build_zones (
        nbz_id      int(11)     unsigned NOT NULL AUTO_INCREMENT,
        planet_id   int(11)     NOT NULL DEFAULT 0,
        zone_name   char(255)   DEFAULT' region_name',
        zone_file   char(255)   DEFAULT 'region_file',
        zone_type   char(255)   DEFAULT NULL,
        x           float       NOT NULL DEFAULT 0,
        z           float       NOT NULL DEFAULT 0,
        radius      float       NOT NULL DEFAULT 0,
        PRIMARY KEY (nbz_id)
      ) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/no_build_zone_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE no_build_zones;
    SQL
    execute query
  end
end
