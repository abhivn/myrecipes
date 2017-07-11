class Chef < ApplicationRecord
    validates_presence_of :chefname, :email
    validates :chefname, length: {maximum: 200}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: {maximum: 200},
    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    before_save :downcase_fields

    def downcase_fields
      self.email.downcase!
    end

end
