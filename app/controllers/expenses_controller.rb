class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @category = Category.all
  end

  def show
   @expense = Expense.find(params[:id])
   @category = Category.find(@expense.category_id)
   @tot_expense = Expense.where("strftime('%m', to_timestamp(created_at)) + 0 = ?", Time.now.strftime("%m").to_i).sum("amount")
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      flash[:success] = "Expense saved!"
      redirect_to @expense
    else
      render 'static_pages/home'
    end
  end

  private

   def expense_params
     params.require(:expense).permit(:category_id, :description, :amount)
   end
end
