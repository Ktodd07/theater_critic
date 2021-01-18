class ReviewsController < ApplicationController
    
    # New
    get '/reviews/new' do
        if logged_in?
            erb :'/reviews/new'
        else
            redirect '/login'
        end
    end

    # Create
    post '/reviews' do
        review = current_user.reviews.build(params)
        if !review.title.empty? && !review.movie.empty? && !review.review.empty?
            review.save
            redirect '/reviews'
        else
            @error = "Submission failed. Information missing. Please try again."
            erb :'/reviews/new'
        end
    end

    # Index
    get '/reviews' do
        if logged_in?
            @reviews = Review.all
            erb :'reviews/index'
        else
            redirect '/login'
        end
    end
  
    # Show
    get '/reviews/:id' do
        if User.find_by(id: session[:user_id])
            @review = Review.find(params[:id])
            erb :'/reviews/show'
        else
            redirect '/login'
        end
    end

    # Edit
    get '/reviews/:id/edit' do
        if logged_in?
            @review = Review.find(params[:id])
            erb :'/reviews/edit'
        else
            redirect '/login'
        end
    end

    # Patch
    patch '/reviews/:id' do
        @review = Review.find(params[:id])
        if !params["review"]["title"].empty? && !params["review"]["movie"].empty? && !params["review"]["review"].empty?
            @review.update(params["review"])
            redirect "/reviews/#{params[:id]}"
        else
            @error = "Submission failed. Information missing. Please try again."
            erb :'/reviews/edit'
        end
    end

    # Delete
    delete '/reviews/:id' do
        review = Review.find(params[:id])
        review.destroy
        redirect '/reviews'
    end
  end