class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.integer :category_id
      t.date :date
      t.text :description
      t.float :amount

      t.timestamps
    end
  end
end
