class Recipe < ApplicationRecord
  validates_presence_of :name, :description, :chef_id
  validates :name, length: {maximum: 200}
  validates :description, length: {minimum: 5, maximum: 500}
  belongs_to :chef
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  default_scope -> {order(updated_at: :desc)}
  has_many :comments, dependent: :destroy

  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"])
    end
  end
end
