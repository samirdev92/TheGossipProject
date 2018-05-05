class CommentsController < ApplicationController
  before_action :find_gossip
  before_action :find_comment, only: %i[edit update destroy]

  def new
    # On instancie un nouveau comment
    @comment = @gossip.comments.new
  end

  def create
    # On passe les params du formulaire pour creer un nouveau comment
    @comment = @gossip.comments.create(comment_params)

    # On renvoie vers la page du gossip
    redirect_to gossip_path(@gossip)
  end

  def edit
    # The work is done by the find_gossip & find_comment before_actions
  end

  def update
    @comment.update(comment_params)
    redirect_to gossip_path(@gossip)
  end

  def destroy
    @comment.destroy
    redirect_to gossip_path(@gossip)
  end

  private

  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end

  def find_comment
    @comment = @gossip.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:anonymous_commentator, :body)
  end
end
