class GossipsController < ApplicationController

  def new
  	@gossip = Gossip.new
  end

  def create
  	@gossip = Gossip.new(gossip_params) 
    @gossip.moussaillon_id = current_moussaillon.id if current_moussaillon
    if @gossip.save
      redirect_to gossip_path(@gossip.id)
    else 
      redirect_to error_path 
    end
  end

  def show
  	@gossip = Gossip.find(params[:id])
    @gossip_anonymous_author = Moussaillon.find(@gossip.moussaillon_id).anonymous_username
    @comment = Comment.new 
    @comments = @gossip.comments 
  end

  def index
    @gossips = Gossip.all
  end

  def edit
    @gossip = Gossip.find(params[:id]) 
  end

  def update
  	@gossip = Gossip.find(params[:id]) 
  	@gossip.update(gossip_params) 
    redirect_to gossip_path(@gossip.id)
  end

  def destroy
  	@gossip = Gossip.find(params[:id]) 
  	@gossip.destroy 
  	redirect_to gossips_path
  end


  private

  def gossip_params 
	params.require(:gossip).permit(:content) 
  end

end
