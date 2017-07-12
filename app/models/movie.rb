class Movie < ApplicationRecord
	has_attached_file :poster, styles: {normal: "272x420#", medium: "300x300#", thumb: "150x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :poster, content_type: /\Aimage\/.*\z/

  	has_many :reviews 

    validates :title, :director, :poster, :synopsis, presence: true

  	def average_review(movie)
		if movie.reviews.blank?
      		return 0
   		else
      		return movie.reviews.average(:rating).round(2)
    	end
  	end

end

