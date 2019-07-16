class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :tasks, through: :projects

  has_secure_password

  # validates :name, presence: true, length: {minimum: 2}
  # validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  # validates :password, presence: true
  # validates_confirmation_of :password

end
