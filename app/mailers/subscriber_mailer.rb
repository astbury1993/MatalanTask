class SubscriberMailer < ApplicationMailer
    default from: "no_reply@curtisblog.herokuapp.com"
    
    def notify(subscriber, article, user)
        @subscriber = subscriber
        @article = article
        @user = user
        mail to: subscriber.email, subject: "New Article on curtisblog by #{user.name)"
    end
end
