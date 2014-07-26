

namespace :deletion do 
  desc "This task is called by the Heroku scheduler add-on"
  task :delete_completed_posts  => :environment do
    Posts = Post.all 
    Posts.each do |post|
      if :completed == true
      post.destroy
      end
    end
  end
end

namespace :deletion do 
desc "This task deletes posts that are older than 1 week"
  task :delete_old_posts => :environment do
    Posts = Post.all 
    Posts.each do |post|
      if :old == true
      post.destroy
      end
    end
  end
end

 
#namespace :notifications do 
  #Rake.application.rake_require "#{Rails.root}/app/mailers/daily_mailer.rb"
  #include daily_email
#desc "This task sends a daily email of a User's post items"
  #task :daily_mailer => :environment do
   # @users = User.all 
    #@users.daily_email
 # end 
#end


