class MoviesController < ApplicationController
    
    # New
    get '/movies/new' do
        if logged_in?
            erb :'/movies/new'
        else
            redirect '/login'
        end
    end

    # Create
    post '/movies' do
        movie = Movie.new(params)
        if !movie.title.empty? && !movie.image.empty? && !movie.description.empty?
            movie.save
            redirect '/movies'
        else
            @error = "Submission failed. Information missing. Please try again."
            erb :'/movies/new'
        end
    end

    # Index
    get '/movies' do
        if logged_in?
            @movies = Movie.all
            erb :'movies/index'
        else
            redirect '/login'
        end
    end
  
    # Show
    get '/movies/:id' do
        if User.find_by(id: session[:user_id])
            @movie = Movie.find(params[:id])
            erb :'/movies/show'
        else
            redirect '/login'
        end
    end

    # Edit
    get '/movies/:id/edit' do
        if logged_in?
            @movie = Movie.find(params[:id])
            erb :'/movies/edit'
        else
            redirect '/login'
        end
    end

    # Patch
    patch '/movies/:id' do
        @movie = Movie.find(params[:id])
        if !params["movie"]["title"].empty? && !params["movie"]["description"].empty?
            @movie.update(params["movie"])
            redirect "/movies/#{params[:id]}"
        else
            @error = "Submission failed. Information missing. Please try again."
            erb :'/movies/edit'
        end
    end

    # Delete
    delete '/movies/:id' do
        movie = Movie.find(params[:id])
        movie.destroy
        redirect '/movies'
    end
  end