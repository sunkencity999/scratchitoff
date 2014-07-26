class DailyMailer < ActionMailer::Base
  default from: "christopher@scratchitoff.co"

  def daily_email
    @user= User.all
    @url = "http://scratchitoff.co/lists"
    mail(to:@user.email, subject: 'Your active to-do items')
  end

end
