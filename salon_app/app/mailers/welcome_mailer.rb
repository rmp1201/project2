class WelcomeMailer < ActionMailer::Base
  default from: "no-reply@jpsSalon.com"


  def welcome_email(user)
  	@user = user
  	email_with_name = "#{@user.first_name} #{@user.last_name} <#{@user.email}>"
  	@url = root_path
  	mail(:to => email_with_name, :subject => "Welcome #{user.first_name} to JP's Hair Salon")
  end

  def feedback_email(appointment)
  	@appointment = appointment
  	@url = "/feedback"
  	mail(:to => User.find(appointment.userID).email, :subject => "Feedback from your appointment")
  end
  
end
