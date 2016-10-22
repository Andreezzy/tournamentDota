class OmniauthCallbacksController < ApplicationController

	def facebook
		@user = User.from_omniauth(request.env["omniauth.auth"])
		#raise request.env["omniauth.auth"].to_yaml
		if @user.persisted?
			@user.remember_me = true
			sign_in_and_redirect @user, event: :authentication
			return
		end

		session["devise.auth"] = request.env["omniauth.auth"]

		render :edit

	end

	def custom_sign_up
		#raise session["devise.auth"].to_yaml
#=begin
	  @user = User.from_omniauth(session["devise.auth"])
		if @user.update(user_params)
			sign_in_and_redirect @user, event: :authentication
		else
			render :edit
		end
#=end
	end

	def failure
	  redirect_to new_user_session_path, notice: "Error: #{params[:error_description]}. Motivo: #{params[:user_denied]}"
	end

	private

	def user_params
	  params.require(:user).permit(:name, :username,	:email)
	end
end
