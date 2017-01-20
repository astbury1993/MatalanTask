class ArticlesController < ApplicationController
    
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
    before_action :require_author, only: [:edit, :update, :destroy]

    # define index event for initial load
    def index
        @user = User.friendly.find(params[:id])
        @articles = @user.articles
    end
    
	# define show event
	def show
		@article = Article.friendly.find(params[:id])
        @user = @article.user
	end

    def new
       @article = current_user.articles.new
    end
    
    
    # define Create event
    def create
        @article = current_user.articles.new(article_params)
        if @article.save
            NotificationsWorker.perform_async(@article.id) # asynchrously send emails to all subscribers
            #UserMailer.notify(@article).deliver_now
            # SubscriberMailer.notify(@article.id).deliver
            redirect_to article_url(@article.slug)
            else
            render 'new'
        end
    end
    
    
    def edit
        @article = Article.friendly.find(params[:id])
    end
	
    # Define Update event
    def update
        @article = Article.friendly.find(params[:id])
        
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
	end
    
    
    # deleting routine
    def destroy
        #@article = Article.find(params[:id])
        #@article.destroy
        
        #redirect_to articles_path
        
        article = Article.friendly.find(params[:id])
        user = article.user
        article.destroy
        redirect_to :back
    end
    
    
	private
		def article_params
		params.require(:article).permit(:title, :text)
		end
        
        def require_login
            unless logged_in?
                flash[:warning] = "You need to sign in to access this page."
                redirect_to root_url
            end
        end
        def require_author
            unless current_user?(Article.friendly.find(params[:id]).user)
                flash[:warning] = "You don't have permission to access this page."
                redirect_to root_url
            end
        end
        
        

end
