class Chef < ApplicationRecord
    has_secure_password
    validates_presence_of :chefname, :email
    validates :chefname, length: {maximum: 200}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: {maximum: 200},
    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: {minimum: 5}, allow_nil: true
    has_many :recipes
    default_scope -> {order(updated_at: :desc)}
    before_save :downcase_fields

    def downcase_fields
      self.email.downcase!
    end

end
