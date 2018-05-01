class CommentsController < ApplicationController

	def new
	  @comment = Comment.new
	end

	def create
	  @comment = Comment.new(comment_params)
	  @comment.gossip_id = params.permit![:gossip_id] 
	  #@comment.anonymous_commentator = params[:comment][:anonymous_commentator]
	  #@comment.body = params[:comment][:body]
	  @comment.save
	  redirect_to gossip_path(@comment.gossip_id)
	end

	def index
	  @comments = Comment.all
	end

	private

    def comment_params 
	  params.require(:comment).permit(:anonymous_commentator, :body)
    end

end



