class PerformanceEffectTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE performance_perform_effect (
        effectName              varchar(14) DEFAULT NULL,
        performanceType         varchar(11) DEFAULT NULL,
        requiredSkillModValue   int(10)     unsigned DEFAULT NULL,
        requiredPerforming      tinyint(1)  DEFAULT NULL,
        targetType              varchar(10) DEFAULT NULL,
        effectDuration          float       DEFAULT NULL,
        effectActionCost        int(10)     unsigned DEFAULT NULL
      ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/performance_effect_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE performance_perform_effect;
    SQL
    execute query
  end
end
