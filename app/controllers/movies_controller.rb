class MoviesController < ApplicationController

  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all
    end

    @markers = @movies.map do |movie|
      {
        lat: movie.latitude,
        lng: movie.longitude,
        info_window: render_to_string(partial: "info_window", locals: { movie: movie }),
        image_url: helpers.asset_url("film-solid.svg")
      }
    end
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save

    redirect_to movie_path(@movie)
  end

  def edit
  end

  def update
    @movie.update(movie_params)

    redirect_to movie_path(@movie)
  end

  def destroy
    @movie.destroy

    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :director, :price, :photo, :genre, :address)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
