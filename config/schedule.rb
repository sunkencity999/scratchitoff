# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#clear temporary cache, sockets, etc

every 1.day do 
  rake "tmp:clear"
end

#delete posts that are older than 7 days

every 1.day do 
  runner "Post.old.destroy"
end

every 1.day do
  runner "Post.completed.destroy"
end

#send daily email of user to-do's (posts)

every 1.day do
  runner "DailyMailer.daily_email"
end
