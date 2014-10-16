class Expense < ActiveRecord::Base
  belongs_to :user
  has_many   :categories
  validates :user_id, presence: true
  validates :category_id, presence: true
end
