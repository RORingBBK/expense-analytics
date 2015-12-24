class ExpensesController < ApplicationController
  def index
  	# @expenses = Expense.all
  	# @expense = Expense.find(params[:id])
    # redirect_to new_expense_path
    @expenses = Expense.all
  end

  def show
  	@expense = Expense.find(params[:id])
  	redirect_to new_expense_path
  end


  def new
  	@expense = Expense.new 
  	@expenses = Expense.all
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def create
  	@expense = Expense.new(expense_params.merge(member_id: current_member.id))

  	if @expense.save
  		redirect_to @expense
  	else
  		render 'new'
  	end
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update(expense_params)
      flash[:success] = "Expense updated."
      redirect_to @expense
    else
      render 'edit'
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to new_expense_path
  end

  private
  	def expense_params
  		params.require(:expense).permit(:title, :description, :amount, :date, :member_id)
  	end
end
