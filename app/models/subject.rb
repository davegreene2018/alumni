class Subject < ApplicationRecord
 
  has_many :forums
  has_many :users, through: :forums # has many users throught the forums, creates a join table


end
