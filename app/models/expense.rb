class Expense < ActiveRecord::Base
  belongs_to :user
  has_many   :categories
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :amount, presence: true
end
