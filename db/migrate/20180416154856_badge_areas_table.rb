class BadgeAreasTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE badge_areas (
        uid         tinyint(1)  unsigned NOT NULL AUTO_INCREMENT,
        planet_id   tinyint(1)  unsigned NOT NULL,
        x           float       NOT NULL,
        y           float       NOT NULL,
        z           float       NOT NULL DEFAULT 0,
        badge_id    tinyint(1)  unsigned NOT NULL,
        PRIMARY KEY (uid),
        KEY SECONDARY (planet_id)
      ) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/badge_areas_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE badge_areas;
    SQL
    execute query
  end
end
