class SessionsController < ApplicationController
    
    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            log_in(user)
            redirect_to root_url
            else
            flash.now[:danger] = "Invalid email or password"
            #render 'pages/home'
            redirect_to root_url
        end
end
    
    def destroy
    log_out
    redirect_to root_url
    end
end