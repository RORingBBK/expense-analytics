class SessionsController < ApplicationController
  def new
  end

  def create
  	member = Member.find_by(member_email: params[:session][:member_email].downcase)
  	if member && member.authenticate(params[:session][:password])
  		# Log In
  		log_in member
  		redirect_to member
  	else
  		# Error
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
  	
  end
end
