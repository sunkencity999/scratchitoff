

namespace :deletion do 
  desc "This task is called by the Heroku scheduler add-on"
  task :delete_completed_posts  => :environment do
    posts = Post.all 
    posts.each do |post|
      if post.completed == true
      post.destroy
      end
    end
  end
end

namespace :deletion do 
desc "This task deletes posts that are older than 1 week"
  task :delete_old_posts => :environment do
    posts = Post.all 
    posts.each do |post|
      if post.old == true
      post.destroy
      end
    end
  end
end

 

 namespace :notifications do 
  desc " Daily posts email to users"
    task :daily_post_email => :environment do 
      users = User.all   
      users.each do |user|
        PostsMailer.daily_email(user)
      end
    end
  end


#namespace :notifications do 
  #Rake.application.rake_require "#{Rails.root}/app/mailers/posts_mailer.rb"
  #include daily_email(users)
#desc "This task sends a daily email of a User's post items"
  #task :daily_mailer => :environment do
   # @users = User.all 
    #@users.daily_email
  #end 
#end


