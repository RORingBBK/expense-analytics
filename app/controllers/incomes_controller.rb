class IncomesController < ApplicationController

	def index
		@incomes = Income.all
	end

	def show
		@income = Income.find(params[:id])
	end

	def new
		@income = Income.new
	end

	def create
		debugger
		@income = Income.new(income_params)
		if @income.save
			# flash[:info] = "Income Added"
			redirect_to @income
		else
			render 'new'
		end
	end

	private
		def income_params
			params.require(:income).permit(:title, :description, :amount, :date)
		end
end
