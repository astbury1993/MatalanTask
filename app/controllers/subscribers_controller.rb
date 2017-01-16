class SubscribersController < ApplicationController
    
    def create
        user = User.friendly.find(params[:user])
        subscriber = user.subscribers.new(subscriber_params)
        if subscriber.save
            flash[:success] = "#{params[:subscriber][:email]} added to the subscriber list."
        else
            flash[:warning] = subscriber.errors.full_messages.first
        end
        redirect_to :back
    end
    
    def unsubscribe
        subscriber = subscriber.find(params[:id])
        if subscriber.unsubscribe_toke == params[:token]
            subscriber.destroy
            flash[:success] = 'You will no longer receive notifications about this users posts'
            redirect_to root_url
        else
            flash[:danger] = 'invalid unsubscribe link'
            redirect_to root_url
        end
    end
    
    private
    
        def subscriber_params
            params.require(:subscriber).permit(:email)
        end
    
end
