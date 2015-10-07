class Category < ActiveRecord::Base

  belongs_to :welcome
  has_many :books
  validates :name, presence: true, uniqueness: true

end