class Category < ActiveRecord::Base
  belongs_to :expense
  validates :name,  presence: true, length: {maximum:50}
end
