class SessionsController < ApplicationController

    def new 
        @user = User.new
    end

    #def create
    #    @user = User.find_by(email: params[:user][:email])
    #         if @user && @user.authenticate(params[:user][:password])
    #             session[:user_id] = @user.id
    #             redirect_to root_path
    #         else
    #             byebug
    #             @messages = @user.errors.full_messages
    #             render :new 
     #        end
    # end
 

    def create
       if @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to root_path
            else
                byebug
                render :new
            end
        else 
            render :new 
        end
    end

    def facebook
        if auth
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.remote_image_url = (auth['info']['image']).gsub('http://','https://')
            u.password = params[:code][0..71]
            end
            session[:user_id] = @user.id
            redirect_to root_path
        else
            @messages = @user.errors.full_messages
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