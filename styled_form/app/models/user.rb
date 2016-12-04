class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :name, length: {minimum: 3}
  validates :email, length: {minimum: 5}
end
