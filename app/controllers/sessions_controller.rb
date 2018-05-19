class SessionsController < ApplicationController

    def new 
        @user = User.new
    end

    def create
        if auth
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            end
            session[:user_id] = @user.id
            redirect_to root_path
        elsif @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to root_path, notice: "Welcome back to the theme park!"
            else
                render :new
            end
        else 
            @user = User.new
            render :new 
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end
   
    private
   
    def auth
      request.env['omniauth.auth']
    end

  end