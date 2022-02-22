class Product < ApplicationRecord
  belongs_to :user
  self.per_page = 2
  validates :name, :price, :user_id, presence: true
  before_save :format

  private

  def format
    self.name.capitalize!
  end
end
