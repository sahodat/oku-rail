# require '/app/models/scraping_j.rb'

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# require File.expand_path(File.dirname(__FILE__) + "/environment"
 #set :environment, :development
 set :environment, :production
 set :output, "current/log/cron_log.log"

# Example:
#
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#π
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every 10.minutes do
  runner 'Scraping_j.get_opdt_joban'
  runner 'Scraping_j2.get_opdt_joban'
  runner 'Scraping_j3.get_opdt_joban'
  runner 'Scraping_y.get_opdt_yamanote'
end
