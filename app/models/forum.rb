class Forum < ApplicationRecord

  belongs_to :subject
  belongs_to :user
  has_many :replies, dependent: :destroy # if forum is destroyed so are the replies

  validates :title, :content, presence: true # validates that their is content to reply

end
