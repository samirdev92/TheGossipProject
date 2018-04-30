class GossipsController < ApplicationController

  def new
  	@gossip = Gossip.new
  end

  def create
  	@gossip = Gossip.new(gossip_params)
    if @gossip.save
      redirect_to gossip_path(@gossip.id)
    else 
      redirect_to error_path
    end
  end

  def show
  	@gossip = Gossip.find(params[:id])
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

  def index
  	@gossips = Gossip.all
  	puts @gossips.class
  end


  private

  def gossip_params 
	params.require(:gossip).permit(:anonymous_author, :content)
  end

end
