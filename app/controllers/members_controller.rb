class MembersController < ApplicationController
  def index
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
  end

  def destroy
  end

  

  private
    def member_params
      params.require(:member).permit(:member_name, :member_email, :password, :password_confirmation)
    end

end
