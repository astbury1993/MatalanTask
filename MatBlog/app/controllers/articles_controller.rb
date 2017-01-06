class ArticlesController < ApplicationController
    # define index event for initial load
    def index
        @articles = Article.all
    end
    
	# define show event
	def show
		@article = Article.find(params[:id])
	end

	# define New event
	def new
	end
	
	# define Create event 
	def create
		@article = Article.new(article_params)
		
		@article.save
		redirect_to @article
	end
	
	private
		def article_params
		params.require(:article).permit(:title, :text)
		end
end
