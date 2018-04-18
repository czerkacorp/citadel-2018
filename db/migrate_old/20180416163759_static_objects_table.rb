class StaticObjectsTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE  statictangibleobjects (
        id            int(10)       unsigned NOT NULL AUTO_INCREMENT,
        zoneid        tinyint(4)    NOT NULL,
        parentid      bigint(20)    NOT NULL,
        name          varchar(255)  NOT NULL,
        template_file varchar(200)  NOT NULL,
        template_type int(255)      NOT NULL,
        template_name varchar(255)  NOT NULL,
        oX float      NOT NULL,
        oY float      NOT NULL,
        oZ float      NOT NULL,
        oW float      NOT NULL,
        X float       NOT NULL,
        Z float       NOT NULL,
        Y float       NOT NULL,
        PRIMARY KEY (id),
        KEY zone_id (zoneid),
        FULLTEXT KEY file_ix (template_file)
      ) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/static_object_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE statictangibleobjects;
    SQL
    execute query
  end
end
