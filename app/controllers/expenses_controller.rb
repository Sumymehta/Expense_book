class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @category = Category.all
  end
end
