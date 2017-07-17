class Recipe < ApplicationRecord
  validates_presence_of :name, :description, :chef_id
  validates :name, length: {maximum: 200}
  validates :description, length: {minimum: 5, maximum: 500}
  belongs_to :chef
  default_scope -> {order(updated_at: :desc)}
end
