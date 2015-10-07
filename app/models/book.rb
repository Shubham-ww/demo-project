class Book < ActiveRecord::Base

  belongs_to :category
  validates :name, :description, presence: :true, uniqueness: true

end
