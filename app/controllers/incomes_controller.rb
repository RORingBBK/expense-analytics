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
		@incomes = Income.all
		@income = Income.create(income_params.merge(member_id: current_member.id))
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
			params.require(:income).permit(:title, :description, :amount, :date, :member_id)
		end
end
