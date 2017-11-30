class UsersController < ApplicationController
  def new
  end

  def login
		@user  = User.create(username: params[:username])
		if @user.valid?
			session[:user_id] = @user.id
			redirect_to '/messages/index'
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to :back
	  end
  end

  def logout
		reset_session
		redirect_to '/'
  end

end
