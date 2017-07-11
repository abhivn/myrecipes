class Recipe < ApplicationRecord
  validates_presence_of :name, :description, length: {maximum: 200}
  validates :description, length: {minimum: 5, maximum: 500}
end
