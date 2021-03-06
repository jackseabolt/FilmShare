class Movie < ApplicationRecord
	has_attached_file :poster, styles: {normal: "272x420#", medium: "300x300#", thumb: "70x70#" }, default_url: "/images/:style/missing.png"
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

    def review_count(movie)
      if movie.reviews.count == 1
        r = " review"
      else
        r = " reviews"
      end 

      return movie.reviews.count.to_s + r
    end

end

