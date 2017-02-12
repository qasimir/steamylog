class Article < ApplicationRecord
	has_many :comments
	validates :title, presence: true, length: {minimum: 5} # this ensures that all articles have a title that is at least five characters long
	
end
