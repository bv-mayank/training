class UsersController < ApplicationController
	def login_page
	end

	def login_user
		@user = User.find_by email: params[:email], password: params[:password]
		if @user
			session[:user_id] = @user.id
			redirect_to '/articles'
		else
			redirect_to '/login'
		end
	end

	def signup_page
		@user = User.new
	end

	def signup_user
		puts "\n\nparams ==="
		puts params
		puts "\n\n"

		puts "\n\nuser_params ==="
		puts user_params
		puts "\n\n"

		@user = User.new(user_params)
		puts "\n\n@user ==="
		puts @user
		puts "\n\n"
		if params[:password] == params[:confirm_password]
			if @user.save
				puts "\n\n@user.id ==="
				puts @user.id
				puts"\n\n"
				session[:user_id] = @user.id
			else
				puts "\n\n@user ==="
				puts @user
				puts "\n\n"
			end
		else
			@user.errors << "Password and confirm password do not match"
		end
	end

	private
	def user_params
		params.require(:user).slice(:email, :password).permit(:email, :password)
	end
end
