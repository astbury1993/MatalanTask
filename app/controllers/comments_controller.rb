class CommentsController < ApplicationController
    
    before_action :require_login, only: [:destroy]
    before_action :require_author, only: [:destroy]
    
    def create
        article = Article.friendly.find(params[:article])
        @comment = article.comments.new(comment_params)
        if @comment.save
            flash[:success] = 'Your comment is now visible'
        else
            flash[:danger] = 'Name and comment are required'
        end
        redirect_to :back
    end
    
    def destroy
        comment = Comment.find(params[:id]).destroy
        flash[:success] = 'Your comment has been deleted'
        redirect_to article_url(comment.article.slug)
    end
    
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
    
    def require_login
        unless logged_in?
            redirect_to root_url
        end
    end
    
    def require_author
        unless current_user?(Comment.find(params[:id]).article.user)
            redirect_to root_url
        end
    end
end