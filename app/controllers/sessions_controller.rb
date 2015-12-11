class SessionsController < ApplicationController
  def new
  end

  def create
  	member = Member.find_by(member_email: params[:session][:member_email].downcase)
  	if member && member.authenticate(params[:session][:member_password])
  		# Log In
  		log_in member
      params[:session][:remember_me] == '1' ? remember(member) : forget(member)
  		redirect_back_or member
  	else
  		# Error
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
