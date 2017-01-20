class UserMailer < ApplicationMailer
    default from: 'noreply@curtisblog.herokuapp.com'
    
    def notify(user)
        @subscriber = subscriber
        @article = article
        @user = user
        @url = 'http://example.com/Login'
        mail(to: @user.email, subject: 'A New Article has been created.')
    end
end
