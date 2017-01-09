class ArticlesController < ApplicationController
    # define index event for initial load
    def index
        @articles = Article.all
    end
    
	# define show event
	def show
		@article = Article.find(params[:id])
	end

    def new
       @article = Article.new
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
    
	private
		def article_params
		params.require(:article).permit(:title, :text)
		end
end
