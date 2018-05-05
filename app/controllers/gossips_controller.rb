class GossipsController < ApplicationController
  before_action :find_gossip, only: %i[show edit update destroy]

  def new
    @gossip = Gossip.new
  end

  def create
    gossip = Gossip.new(gossip_params)
    gossip.moussaillon = current_moussaillon

    if gossip.save
      redirect_to gossip_path(gossip)
    else
      redirect_to error_path
    end
  end

  def show
    @gossip_anonymous_author = @gossip.moussaillon&.anonymous_username
    @comment = Comment.new
  end

  def index
    @gossips = Gossip.all
  end

  def edit
    # All is done in the find_gossip before_action
  end

  def update
    @gossip.update(gossip_params)
    redirect_to gossip_path(@gossip)
  end

  def destroy
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def find_gossip
    @gossip = Gossip.find(params[:id])
  end

  def gossip_params
    params.require(:gossip).permit(:content)
  end
end
