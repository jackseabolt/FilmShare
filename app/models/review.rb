class Review < ApplicationRecord

	belongs_to :movie
	validates :comment, presence: true
	
end
