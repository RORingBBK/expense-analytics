class RemindersController < ApplicationController

	def index
		@reminders = Reminder.all
	end

	def show
		@reminder = Reminder.find(params[:id])
	end

	def new
		@reminder = Reminder.new
	end

	def create
		@reminder = Reminder.create(reminder_params.merge(member_id: current_member.id))
	end

	private
		def reminder_params	
			params.require(:reminder).permit(:title, :date_notify, :type, :member_id)
		end
end
