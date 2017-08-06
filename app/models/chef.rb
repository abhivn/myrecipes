class Chef < ApplicationRecord
    has_secure_password
    validates_presence_of :chefname, :email
    validates :chefname, length: {maximum: 200}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: {maximum: 200},
    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: {minimum: 5}, allow_nil: true
    has_many :recipes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_attached_file :image, styles: { large: "600x600>", medium: "200x200>", thumb: "150x150#" }, default_url: ActionController::Base.helpers.asset_path('missing.png')
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

    default_scope -> {order(updated_at: :desc)}
    before_save :downcase_fields

    def downcase_fields
      self.email.downcase!
    end
end
