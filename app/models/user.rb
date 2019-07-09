class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :tasks, through: :projects

  has_secure_password
end
