class ExpensesController < ApplicationController
 
  def index
    @expenses = current_member.expenses
  end

  def show
  	@expense = Expense.find(params[:id])
  end

  def new
  	@expense = Expense.new
  end

  def create
  	@expenses = current_member.expenses
  	@expense = Expense.create(expense_params.merge(member_id: current_member.id))
  end

  def edit
  	@expense = Expense.find(params[:id])
  end

  def update
  	@expenses = current_member.expenses
  	@expense = Expense.find(params[:id])

  	@expense.update_attributes(expense_params)
  end

  def delete
  	@expense = Expense.find(params[:expense_id])
  end

  def destroy
  	@expenses = current_member.expenses
  	@expense = Expense.find(params[:id])
  	@expense.destroy
  end

  private 
  	def expense_params
  		params.require(:expense).permit(:title, :description, :amount, :date).merge(member_id: current_member.id)
  	end
end
