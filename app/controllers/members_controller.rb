class MembersController < ApplicationController
  def index
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  
  def edit
  end

  def update
  end

  def destroy
  end

  def create
    debugger
    @member = Member.new(member_params)
    if @member.save
      log_in @member
      flash[:success] = "Maintain your Expenses from today."
      redirect_to @member
    else
      render 'new'
    end
  end


  private
    def member_params
      params.require(:member).permit(:member_name, :member_email, :member_country, :password, :password_confirmation)
    end

end
