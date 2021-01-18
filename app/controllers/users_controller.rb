class UsersController < ApplicationController

    # Create Account
    get '/signup' do
        if logged_in?
            redirect ''
        else
        erb :'users/signup'
        end
    end

    post '/signup' do
        user = User.new(params)
        if user.username.empty? || user.password.empty?
            @error = "Username or password can not be blank. Please try again."
            erb :'users/signup'
        elsif User.find_by(username: user.username)
            @error = "That username already exists. Please try again."
            erb :'users/signup'
        else
            user.save
            session[:user_id] = user.id
            redirect ''
        end
    end

    # Edit Account
    get '/edit' do
        if logged_in?
            erb :'users/edit'
        else
            redirect '/login'
        end
    end

    patch '/edit' do
        current_user.update(params[:user])
        redirect ''
    end

    # Log Out
    get '/logout' do
        if logged_in?
            session.clear
            redirect ''
        else
            redirect ''
        end
    end

    post '/logout' do
        session.clear
        redirect ''
    end

    # Delete Account
    get '/delete' do
        if logged_in?
            erb :'users/delete'
        else
            redirect '/login'
        end
    end

    delete '/delete' do
        current_user.destroy
        session.clear
        redirect ''
    end

end