class Reply < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  validates :reply, presence: true

  

end