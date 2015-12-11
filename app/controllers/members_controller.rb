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
      log_in @member
      flash[:success] = "Maintain your Expenses from today."
      redirect_to @member
    else
      render 'new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      # Handle a successful update.
      flash[:success] = "Profile Updated"
      redirect_to @member
    else
      render 'edit'
    end
  end

  private
    def member_params
      params.require(:member).permit(:member_name, :member_email, :member_country, :password, :password_confirmation)
    end

end
