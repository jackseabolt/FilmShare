class ReviewsController < ApplicationController

	def create 
		@review = Review.create(review_params)
		@movie = Movie.find(params[:movie_id])
		@review.movie_id = @movie.id
		if @review.save
			flash[:success] = "Your review was posted"
			redirect_to movie_path(@movie)
		else 
			flash[:danger] = "There was a problem with your request"
			redirect_to movie_path(@movie)
		end 
	end 

	private

		def review_params
			params.require(:review).permit(:comment, :rating)
		end  

end
