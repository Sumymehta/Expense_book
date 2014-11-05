class RemoveDateFromExpenses < ActiveRecord::Migration
  def change
   remove_column :expenses, :date, :date
  end
end
