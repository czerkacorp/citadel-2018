class MissionReconLocsTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE mission_manager_recon_locs (
        id              int(10)       unsigned NOT NULL AUTO_INCREMENT,
        zoneid          tinyint(4)    NOT NULL,
        template_file   varchar(200)  NOT NULL,
        template_type   int(255)      NOT NULL,
        oX              float         NOT NULL,
        oY              float         NOT NULL,
        oZ              float         NOT NULL,
        oW              float         NOT NULL,
        X               float         NOT NULL,
        Z               float         NOT NULL,
        Y               float         NOT NULL,
        PRIMARY KEY (id),
        KEY zone_id (zoneid),
        FULLTEXT KEY file_ix (template_file)
      ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/mm_recon_locs_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE mission_manager_recon_locs;
    SQL
    execute query
  end
end
