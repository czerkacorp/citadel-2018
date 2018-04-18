class TrainersTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE trainers (
        Location          varchar(64)     DEFAULT NULL,
        `Trainer Name`    varchar(64)     DEFAULT NULL,
        `Trainer Type`    varchar(64)     DEFAULT NULL,
        Profession        varchar(64)     NOT NULL,
        CRC1              varchar(16)     DEFAULT NULL,
        CRC2              varchar(16)     DEFAULT NULL,
        CRC3              varchar(16)     DEFAULT NULL,
        Planet            smallint(6)     DEFAULT NULL,
        Cell              bigint(20)      DEFAULT 0,
        WorldX            double          DEFAULT 0,
        WorldY            double          DEFAULT 0,
        WorldZ            double          DEFAULT 0,
        CellX             double          DEFAULT 0,
        CellY             double          DEFAULT 0,
        CellZ             double          DEFAULT 0,
        oY                double          DEFAULT 0,
        oW                double          DEFAULT 0,
        pix               int(10)         unsigned NOT NULL AUTO_INCREMENT,
        planetmapid       tinyint(1)      unsigned NOT NULL DEFAULT 0,
        PRIMARY KEY (pix),
        KEY pix (pix)
      ) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=latin1;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/trainer_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE trainer;
    SQL
    execute query
  end
end
