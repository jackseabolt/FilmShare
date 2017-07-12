class MoviesController < ApplicationController

	before_action :find_movie, only: [:show, :edit, :update, :destroy ]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def show
		@reviews = @movie.reviews.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
		@review = Review.new
		if @movie.reviews.blank?
      		@average_review = 0
   		else
      		@average_review = @movie.reviews.average(:rating).round(2)
    	end
	end 

	def index 
		@movies = Movie.all.order(title: :asc).paginate(:page => params[:page], :per_page => 3)
	end 

	def new
		@movie = Movie.new
	end 

	def create
		@movie = Movie.create(movie_params)
		if @movie.save
			flash[:success] = "Your movie was created!"
			redirect_to root_path
		else
			flash[:danger] = "There was a problem with your request"
			render :new 
		end 
	end 

	def edit

	end 

	def update 
		if @movie.update(movie_params)
			flash[:success] = "Your movie was updated"
			redirect_to movie_path 
		else 
			flash[:danger] = "There was a problem with your request"
		end
	end 

	def destroy 
		if @movie.destroy
			flash[:success] = "Your movie was removed"
			redirect_to movies_path 
		else 
			flash[:danger] = "There was a problem with your request"
			render :index
		end 
	end 

	private 

		def movie_params 
			params.require(:movie).permit(:title, :director, :poster, :synopsis)
		end 

		def find_movie 
			@movie = Movie.find(params[:id])
		end 

end
