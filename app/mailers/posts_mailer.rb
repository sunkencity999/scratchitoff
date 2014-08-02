class PostsMailer < ActionMailer::Base
 default from: "christopher@scratchitoff.co"

  def daily_email(user)
    @user= user
    @posts = user.posts
    @url = "http://scratchitoff.co/lists"
    mail(to:@user.email, subject: 'Your active to-do items')
  end

end

