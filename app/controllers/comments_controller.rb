class CommentsController < ApplicationController
    

    
    def create
        article = Article.friendly.find(params[:article])
        @comment = article.comments.new(comment_params)
        redirect_to :back
    end
    
    def destroy
        comment = comment.find(params[:id]).destroy
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