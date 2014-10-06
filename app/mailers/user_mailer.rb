class UserMailer < ActionMailer::Base
	default from: "from@example.com"

	def notify_user(user)
		@user = user
		@url  = 'http://localhost:3000'
		mail(to: @user.email, subject: 'Welcome to GroupOfis')
	end
end
