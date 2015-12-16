class IncomesController < ApplicationController

	def index
		@incomes = Income.all
	end

	def show
		@income = Income.find(params[:id])
		render :template => 'incomes/index'
	end

	def new
		@income = Income.new
	end

	def create
		@income = Income.new(income_params.merge(member_id: current_member.id))
		if @income.save
			# flash[:info] = "Income Added"
			redirect_to @income
		else
			render 'new'
		end
	end

	private
		def income_params
			params.require(:income).permit(:title, :description, :amount, :date, :member_id)
		end


end
