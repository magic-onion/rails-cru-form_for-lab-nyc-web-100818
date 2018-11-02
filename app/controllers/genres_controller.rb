class GenresController < ApplicationController

  public

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find_by(id: params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(post_params(:name))
    @genre.save
    redirect_to genre_path(@genre.id)
  end

  def edit
    @genre = Genre.find_by(id: params[:id])
  end

  def update
    @genre = Genre.find_by(id: params[:id])
    @genre.update(post_params(:name))
    @genre.save
    redirect_to @genre
  end

  private
  def post_params(*args)
    params.require(:genre).permit(*args)
  end

end