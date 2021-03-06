# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  password_digest :text
#  employer_title  :text
#  junior_title    :text
#  user_type       :integer
#  image           :text
#  bio             :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company         :text
#

class User < ApplicationRecord
  has_secure_password
  enum user_type: [:employer, :junior]
  has_many :notes
  has_many :jobs
  has_and_belongs_to_many :favourites
  validates :email, presence: true, uniqueness: true
  validates :name, length: { minimum: 2 }
  validates :bio, length: { maximum: 500 }
end
