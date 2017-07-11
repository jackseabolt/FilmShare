class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "Review"
  belongs_to :rateable, :polymorphic => true

  #attr_accessible :rate, :dimension

end