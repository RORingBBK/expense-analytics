class MembersController < ApplicationController
  before_action :logged_in_member, only: [:index, :edit, :update, :destroy]
  before_action :correct_member, only: [:edit, :update]
  before_action :admin_member, only: :destroy

  def index
    # @members = Member.all
    @members = Member.paginate(page: params[:page])
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

  def destroy
    Member.find(params[:id]).destroy
    flash[:success] = "Member deleted"
    redirect_to members_url
  end

  def edit
    # @member = Member.find(params[:id])
  end

  def update
    # @member = Member.find(params[:id])
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

    # Before filters

    # Confirms a logged-in member.
    def logged_in_member
      unless logged_in?
        store_location
        flash[:danger] = "Please Log In"
        redirect_to login_url
      end
    end

    #Confirms the correct member.
    def correct_member
      @member = Member.find(params[:id])
      redirect_to(root_url) unless current_member?(@member)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_member.admin?
    end
end
