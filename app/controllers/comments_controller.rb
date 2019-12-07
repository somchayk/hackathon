class CommentsController < ApplicationController
  before_action :set_movie
  before_action :set_comment, only: [:show, :update, :edit, :destroy]

  def index
    @comments = @movie.comments
  end

  def show
  end

  def edit
    render :edit
  end

  def new
    @comment = @movie.comments.new
  end

  def create
    @comment = @movie.comments.new(comment_params)
    if @comment.save
      redirect_to @movie
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to movie_comment_path(@movie)
  end

  def update
    @comment = @movie.comments.new(comment_params)
    if @comment.save
      redirect_to [@movie, @comment]
    else
      render :new
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
