class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new_form
    render("movies/new_form.html.erb")
  end

  def create_row
    new_movie = Movie.new
    movie_title = params[:title]
    movie_year = params[:year]
    movie_duration = params[:duration]
    movie_description = params[:description]
    movie_image_url = params[:image_url]
    movie_director_id = params[:director_id]
    new_movie.title = movie_title
    new_movie.year = movie_year
    new_movie.duration = movie_duration
    new_movie.description = movie_description
    new_movie.image_url = movie_image_url
    new_movie.director_id = movie_director_id
    new_movie.save

    redirect_to("/movies/#{new_movie.id}")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    edit_movie =  Movie.find(params[:id])
    movie_title = params[:title]
    movie_year = params[:year]
    movie_duration = params[:duration]
    movie_description = params[:description]
    movie_image_url = params[:image_url]
    movie_director_id = params[:director_id]

    edit_movie.title = movie_title
    edit_movie.year = movie_year
    edit_movie.duration = movie_duration
    edit_movie.description = movie_description
    edit_movie.image_url = movie_image_url
    edit_movie.director_id = movie_director_id
    edit_movie.save

    redirect_to("/movies/#{edit_movie.id}")
  end

  def destroy
    movie = Movie.find(params[:id])
    @movie_title = movie.title
    movie.destroy
  end
end
