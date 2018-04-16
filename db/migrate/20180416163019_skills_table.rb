class SkillsTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE skills (
        skill_id                        int(10)       unsigned NOT NULL AUTO_INCREMENT,
        skill_name                      varchar(52)   DEFAULT NULL,
        skill_parent                    varchar(52)   DEFAULT NULL,
        skill_graph_type                varchar(10)   DEFAULT NULL,
        skill_god_only                  tinyint(1)    DEFAULT NULL,
        skill_is_title                  tinyint(1)    DEFAULT NULL,
        skill_is_profession             tinyint(1)    DEFAULT NULL,
        skill_is_hidden                 tinyint(1)    DEFAULT NULL,
        skill_money_required            int(10)       unsigned DEFAULT NULL,
        skill_points_required           int(10)       unsigned DEFAULT NULL,
        skill_requirements_count        int(10)       unsigned DEFAULT NULL,
        skill_requirements              varchar(201)  DEFAULT NULL,
        skill_preclusions               varchar(50)   DEFAULT NULL,
        skill_xp_type                   varchar(40)   DEFAULT NULL,
        skill_xp_cost                   int(10)       unsigned DEFAULT NULL,
        skill_xp_cap                    int(10)       unsigned DEFAULT NULL,
        skill_required_missions         varchar(1)    DEFAULT NULL,
        skill_apprenticeships_required  int(10)       unsigned DEFAULT NULL,
        skill_stats_required            varchar(1)    DEFAULT NULL,
        skill_species_required          varchar(56)   DEFAULT NULL,
        skill_jedi_state_required       varchar(16)   DEFAULT NULL,
        skill_abilities                 varchar(1)    DEFAULT NULL,
        skill_commands                  text,
        skill_mods                      text,
        skill_schematics_granted        varchar(123)  DEFAULT NULL,
        skill_schematics_revoked        varchar(1)    DEFAULT NULL,
        skill_is_searchable             tinyint(1)    DEFAULT NULL,
        skill_ender                     int(10)       unsigned DEFAULT NULL,
        PRIMARY KEY (skill_id),
        UNIQUE KEY skill_id (skill_id)
      ) ENGINE=InnoDB AUTO_INCREMENT=1069 DEFAULT CHARSET=latin1;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/skill_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE skills;
    SQL
    execute query
  end
end
