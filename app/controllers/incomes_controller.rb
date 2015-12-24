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
		@incomes = Income.all
		@income = Income.create(income_params)
	end

	def edit
		@income = Income.find(params[:id])
	end

	def update
		@incomes = Income.all 
		@income = Income.find(params[:id])

		@income.update_attributes(income_params)
	end

	def delete
		@incomes = Income.all
		@income = Income.find(params[:income_id])
	end

	def destroy
		@incomes = Income.all
		@income = Income.find(params[:id])
		@income.destroy
	end

	private
		def income_params
			params.require(:income).permit(:title, :description, :amount, :date)
		end
end
