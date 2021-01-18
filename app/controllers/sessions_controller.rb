class SessionsController < ApplicationController

    # Log In
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        if params["username"].empty? || params["password"].empty?
            @error = "Username or password can not be blank. Please try again."
            erb :'users/login'
        else
            if user = User.find_by(username: params["username"], password: params["password"])
                session[:user_id] = user.id
                redirect ''
            else
                @error = "Account could not be found."
                erb :'users/login'
            end
        end
    end

    # Log Out
    get '/logout' do
        session.clear
        redirect '/'
    end

end