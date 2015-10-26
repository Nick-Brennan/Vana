module WelcomeHelper
	def current_user
		@user ||= session[:user_id] && User.find(session[:user_id])
	end
end
