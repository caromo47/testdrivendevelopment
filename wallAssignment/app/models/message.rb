class Message < ActiveRecord::Base
  belongs_to :user
	has_many :users
	has_many :comments

	validates :message, :user, presence: true
	validates :message, length: { minimum: 10 }
end
