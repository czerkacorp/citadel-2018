class GalaxyTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE galaxy (
        galaxy_id             int(5)          unsigned NOT NULL AUTO_INCREMENT,
        name                  varchar(50)     NOT NULL,
        address               varchar(100)    NOT NULL,
        port                  int(8)          NOT NULL,
        pingport              int(8)          DEFAULT NULL,
        population            int(4)          NOT NULL DEFAULT 0,
        PRIMARY KEY (galaxy_id)    
      ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
    SQL
    execute query
  end

  def down
    query = <<-SQL
      DROP TABLE galaxy;
    SQL
    execute query
  end
end
