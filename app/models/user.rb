class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :forums, dependent: :destroy
  has_many :subjects, through: :forums
  has_many :channels, through: :subjects
  #belongs_to :profile
  has_many :friendships
  #has_many :users #
  has_many :friends, :through => :friendships
end
