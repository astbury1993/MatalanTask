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
		@article = Article.find(params[:id])
        @user = @article.user
	end

    def new
       @article = current_user.Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
    end
	
	# define Create event 
	def create
		@article = Article.new(article_params)
		
		if @article.save
		redirect_to @article
        else
        render 'new'
        end
	end
    
    # Define Update event
    def update
        @article = Article.find(params[:id])
        
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
	end
    
    
    # deleting routine
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        redirect_to articles_path
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
            unless current_user?(Article.find(params[:id]).user)
                flash[:warning] = "You don't have permission to access this page."
                redirect_to root_url
            end
        end
        
        

end
