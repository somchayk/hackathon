class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :edit, :destroy]

  def index
    @movies = Movie.all
  end

  def show
  end

  def edit
    render :edit
  end

  def new
    @movie = Movie.new
    render :new
  end

  def create
    @movie = current_user.movies.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end


  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :duration, :genre, :description, :trailer)
  end
end
