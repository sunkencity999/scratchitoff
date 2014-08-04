class PostsMailer < ActionMailer::Base
 default from: "christopher@scratchitoff.co"

  def daily_email(user)
    @user= user
    056
    p56l @posts = user.posts
    @url = "http://scratchitoff.herokuapp.com/lists"
    mail(to:@user.email, subject: 'Your active to-do items')
  end

end

