class RemindersController < ApplicationController

	def index
		@reminders = Reminder.all
		redirect_to member_path
	end

	def show
		@reminder = Reminder.find(params[:id])
	end

	def new
		@reminder = Reminder.new
	end

	def create
		@reminder = Reminder.new(reminder_params.merge(member_id: current_member.id))
		if @reminder.save
			render 'index'
		else
			redirect_to @reminder
		end
	end

	private
		def reminder_params	
			params.require(:reminder).permit(:title, :date_notify, :type, :member_id)
		end
end
