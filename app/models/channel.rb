class Channel < ApplicationRecord
  has_many :subjects
  has_many :users, through: :subjects # has many users throught the forums, creates a join table
end
