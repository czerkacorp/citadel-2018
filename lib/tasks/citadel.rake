require 'rake'
require 'open-uri'
require 'active_record'

namespace :citadel do

  desc "Initial database import and setup"
  task dbsetup: :environment do
    puts "-----------------------------------------------------------"
    puts "- Running rake task citadel:dbsetup" 
    puts "- Desc: Initial databse import and setup"
    puts "-----------------------------------------------------------"
    puts ""

    puts "Drop existing databases before continuing? y/n"
      while input = (STDIN.gets.chomp)
      case input
        when "y" || "Y"
          puts "...dropping existing databases" 
          `rake db:drop`
          break
        when "n" || "N"
          puts "...skipping drop of existing databases"
          break
        else 
          puts "#{input} is not a valid response. Please enter y or n"
        end
      end


    puts ""
    puts "...creating databases from database.yml" 
    puts ""
    `rake db:create`

    connection_config = ActiveRecord::Base.connection_config
    downloads = [open('https://review.swgemu.com/gitweb?p=Core3.git;a=blob_plain;f=MMOCoreORB/sql/swgemu.sql;hb=refs/heads/unstable'),
      open('https://review.swgemu.com/gitweb?p=Core3.git;a=blob_plain;f=MMOCoreORB/sql/mantis.sql;hb=refs/heads/unstable')]
  
    downloads.each do |download|
      initialname = download.meta['content-disposition'].match(/filename=(\"?)(.+)\1/)[2]
      filename = initialname.match(/[^\\\/]+(?=\.[\w]+$).sql|[^\\\/]$/)
      
      puts "...downlading #{filename} from SWGEmu repository"
      IO.copy_stream(download, "./db/swgemu/#{filename}")
      puts "...completed downloading #{filename} from SWGEmu repository"

      puts "...updating #{filename} to work with Citadel"
      File.write("./db/swgemu/#{filename}",File.open("./db/swgemu/#{filename}",&:read).gsub("swgemu",ActiveRecord::Base.connection_config[:database]))
      puts "...completed updating #{filename}"

      puts "...connecting to MySQL and importing #{filename}"
      `mysql -h #{connection_config[:host]} -u #{connection_config[:username]} -p#{connection_config[:password]} #{connection_config[:database]} < ./db/swgemu/#{filename}`
      puts "...finished importing #{filename}"
      puts ""

    end

    puts "...migrating Citadel database tables"
    `rake db:migrate`
    puts "...finished migrating Citadel database tables" 
    puts ""

    puts "-----------------------------------------------"
    puts "- Initial database set up and import completed!"
    puts "-----------------------------------------------"

  end

  desc "Call for TK-421"
  task tk421: :environment do
    puts ""
    5.times do
      puts "'TK-421, why aren't you at your post?'"
    end
  end

  desc "Returns the current database in use"
  task dbname: :environment do
    puts "---------------------------------------------"
    puts "- Running rake task citadel:dbname ----------" 
    puts "- Desc: Returns the current database in use -"
    puts "---------------------------------------------"
    puts ""
    puts "- Current database: " + ActiveRecord::Base.connection_config[:database]
    puts ""
  end

end

# 