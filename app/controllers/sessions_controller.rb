class SessionsController < ApplicationController
    
    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            log_in(user)
            redirect_to articles_for_user_path(current_user)
            else
            flash.now[:danger] = "Invalid email or password"
            #render 'pages/home'
            redirect_to root_url
        end
end
    
    def destroy
    log_out
    flash[:success] = "Logged Out Successfully"
    redirect_to root_url
    end
end