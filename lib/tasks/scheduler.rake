desc "This task is called by the Heroku scheduler add-on"
task :delete_completed_posts => :environment do
  Posts.completed.destroy
end

desc "This task sends a daily email of a User's post items"
task :daily_mailer => :environment do
  User.daily_mail
end

desc "This task deletes posts that are older than 1 week"
task :delete_old_posts => :environment do
  Posts.old.destroy
end
