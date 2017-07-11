class Movie < ApplicationRecord
	has_attached_file :poster, styles: {normal: "500x360#", medium: "300x300#", thumb: "150x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :poster, content_type: /\Aimage\/.*\z/

  	has_many :reviews 

end

