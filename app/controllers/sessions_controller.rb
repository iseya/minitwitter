class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sigin_in user
			redirect_to user
		else
			flash.now[:error] = 'Invalidemail/password combination'
			render 'new'
		end

	end

	def destory
		sign_out
		redirect_to root_url
	end


end
