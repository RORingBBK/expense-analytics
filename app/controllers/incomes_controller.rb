class IncomesController < ApplicationController

	def index
		all_income
		@income = Income.find(params[:id])
		# @incomes = Income.paginate(page: params[:page], per_page: 5)
		# @incomes = Income.where(member_id: current_member.id)
	end

	def show
		all_income
		# @incomes = Income.paginate(page => params[:page], :per_page => 30)
		redirect_to new_income_path
	end

	def new
		@income = Income.new
		all_income
		@incomes = Income.paginate(page: params[:page], per_page: 5)
	end

	def edit
		@income = Income.find(params[:id])
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

	def update
		@income = Income.find(params[:id])
		if @income.update(income_params)
			flash[:success] = "Income updated."
			redirect_to @income
		else
			render 'edit'
		end
end

	def destroy
		@income = Income.find(params[:id])
		@income.destroy

		redirect_to new_income_path
	end

	private

		def income_params
			params.require(:income).permit(:title, :description, :amount, :date, :member_id)
		end

		def all_income
			@incomes = Income.all
		end


end
