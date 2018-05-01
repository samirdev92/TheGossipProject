class CommentsController < ApplicationController

	def new
	  @gossip = Gossip.find(params[:gossip_id])	
	  @comment = Comment.new
	end

	def create
	  @gossip = Gossip.find(params[:gossip_id])	
	  @comment = Comment.create(comment_params)
	  redirect_to gossip_path(@comment.gossip_id)
	end


	def edit
      @gossip = Gossip.find(params[:gossip_id])	
	  @comment = @gossip.comments.find(params[:id])

    end

    def update
      @gossip = Gossip.find(params[:gossip_id])	
	  @comment = @gossip.comments.find(params[:id])
  	  @comment.update(comment_params)
	  redirect_to gossip_path(@comment.gossip_id)
    end

	def destroy
	  @gossip = Gossip.find(params[:gossip_id])	
	  @comment = @gossip.comments.find(params[:id])
	  @gossip.destroy
	  redirect_to gossip_path(@comment.gossip_id)

	end



	private

    def comment_params 
	  params.require(:comment).permit(:anonymous_commentator, :body, :gossip_id)
    end

end


