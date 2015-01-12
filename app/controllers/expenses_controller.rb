class ExpensesController < ApplicationController
  before_action :correct_user, only: :destroy
  def new
    @expense = Expense.new
    @category = Category.all
    @expenses = current_user.expenses.paginate(page: params[:page])
  end

  def index
    @expense = Expense.new
    @expenses = current_user.expenses.paginate(page: params[:page])
    @category = Category.all
  end

  def show
   @expenses = current_user.expenses.paginate(page: params[:page])
   #@expense = Expense.find(params[:id])
   #@category = Category.find(@expenses.category_id)
   @tot_expense = @expenses.where("extract(month from created_at) = ?", Time.now.strftime("%m").to_i).sum("amount")
  end 

  def create
    @expense = current_user.expenses.build(expense_params)
    @category = Category.all
    if @expense.save
      flash[:success] = "Expense saved!"
      redirect_to @expense
    else
      render 'new'
    end
  end

  def destroy
    @expense.destroy
    flash[:success] = "Expense deleted"
    redirect_to request.referrer || root_url
  end

  def dateFilter  
   @expenses = current_user.expenses.where(:created_at => (params[:start_date]..params[:end_date]))

  respond_to do |format|
      format.html
      format.json { render json: @expenses }
      format.js
  end
end

  private

   def expense_params
     params.require(:expense).permit(:category_id, :description, :amount)
   end

   def correct_user
     @expense = current_user.expenses.find_by(id: params[:id])
      redirect_to root_url if @expense.nil?  
   end
end
