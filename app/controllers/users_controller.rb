class UsersController < ApplicationController
    
    def index
        # User.find :all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            redirect_to articles_for_user_path(@user.slug)
        else
        render :new
        end
        
        
    end
        
    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
        
end
