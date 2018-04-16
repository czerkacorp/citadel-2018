class PerformanceTable < ActiveRecord::Migration[5.1]
  def up
    query = <<-SQL
      CREATE TABLE performance (
        performanceName         varchar(11)   DEFAULT NULL,
        instrumentAudioId       int(10)       unsigned DEFAULT NULL,
        requiredSong            varchar(21)   DEFAULT NULL,
        requiredInstrument      varchar(11)   DEFAULT NULL,
        requiredDance           varchar(22)   DEFAULT NULL,
        danceVisualId           int(10)       unsigned DEFAULT NULL,
        actionPointsPerLoop     int(10)       unsigned DEFAULT NULL,
        loopDuration            float         DEFAULT NULL,
        type                    int(11)       DEFAULT NULL,
        baseXp                  int(10)       unsigned DEFAULT NULL,
        flourishXpMod           int(10)       unsigned DEFAULT NULL,
        healMindWound           int(10)       unsigned DEFAULT NULL,
        healShockWound          int(10)       unsigned DEFAULT NULL,
        requiredSkillMod        varchar(21)   DEFAULT NULL,
        requiredSkillModValue   int(10)       unsigned DEFAULT NULL,
        mainloop                varchar(40)   DEFAULT NULL,
        flourish1               varchar(46)   DEFAULT NULL,
        flourish2               varchar(46)   DEFAULT NULL,
        flourish3               varchar(46)   DEFAULT NULL,
        flourish4               varchar(46)   DEFAULT NULL,
        flourish5               varchar(46)   DEFAULT NULL,
        flourish6               varchar(46)   DEFAULT NULL,
        flourish7               varchar(46)   DEFAULT NULL,
        flourish8               varchar(46)   DEFAULT NULL,
        intro                   varchar(41)   DEFAULT NULL,
        outro                   varchar(41)   DEFAULT NULL,
        ix                      int(10)       unsigned NOT NULL AUTO_INCREMENT,
        PRIMARY KEY (ix),
        KEY iAudio_ix (instrumentAudioId),
        KEY iDance_ix (danceVisualId)
      ) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;
    SQL
    execute query

    seeds = File.read("db/sql_seeds/performance_seeds.sql")
    seed_statements = seeds.split(";")
    seed_statements.each do |statement|
      execute statement
    end
  end

  def down
    query = <<-SQL
      DROP TABLE performance;
    SQL
    execute query
  end
end
