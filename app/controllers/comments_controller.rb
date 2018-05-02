class CommentsController < ApplicationController

  def new
    @gossip = Gossip.find(params[:gossip_id]) #Permet de s'assurer que l'on est bien sur le bon gossip: celui de notre commentaire
    @comment = Comment.new #on instancie un nouveau comment
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])	
    @comment = Comment.create(comment_params) #On passe les params du formulaire pour créer un nouveau comment
    redirect_to gossip_path(@comment.gossip_id) #On renvoie vers la page du gossip
  end


  def edit
    @gossip = Gossip.find(params[:gossip_id])	
    @comment = @gossip.comments.find(params[:id]) #On ne s'intéresse qu'à un comment en particulier, que l'on retrouve grâce à son ID
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
    @comment.destroy
    redirect_to gossip_path(@comment.gossip_id)
end


  private

  def comment_params 
    params.require(:comment).permit(:anonymous_commentator, :body, :gossip_id) #on a réussi à passer le gossip_id dans notre hash grâce au field particulier qu'on a rajouté dans notre form
  end

end


