class GossipsController < ApplicationController

  def new
  	@gossip = Gossip.new #Toujours initialiser sa classe
  end

  def create
  	@gossip = Gossip.new(gossip_params) #Chaque nouvelle instance de Gossip est créée grâce à ce que l'utilisateur rentre dans son formulaire, et donc les gossip_params
    if @gossip.save
      redirect_to gossip_path(@gossip.id)
    else 
      redirect_to error_path #page d'erreur si l'enregistrement ne se fait pas i.e. si l'utilisateur n'a pas indiqué son nom ou son gossip
    end
  end

  def show
  	@gossip = Gossip.find(params[:id]) #On affiche ici la page spécifique au gossip choisi, que l'on retrouve grâce à son ID
    @comment = Comment.new #Lignes nécessaires car on veut afficher les commentaires sur la page du gossip
    @comments = Comment.where(gossip_id: params[:id]) #On ne s'intéresse aux comments que du gossip de la page
  end


  def index
    @gossips = Gossip.all
  end


  def edit
    @gossip = Gossip.find(params[:id]) #Permet de s'assurer que l'on édite bien le bon gossip
  end

  def update
  	@gossip = Gossip.find(params[:id]) #Permet de s'assurer que l'on édite bien le bon gossip
  	@gossip.update(gossip_params) #update est une méthode prédéfinie du CRUD. On passe les nouveaux params à notre gossip
    redirect_to gossip_path(@gossip.id)
  end

  def destroy
  	@gossip = Gossip.find(params[:id]) #Permet de s'assurer que l'on édite bien le bon gossip
  	@gossip.destroy #destroy est une méthode prédéfinie du CRUD.
  	redirect_to gossips_path
  end


  private

  def gossip_params 
	params.require(:gossip).permit(:anonymous_author, :content) #"permit" nous permet de récupérer les params de nos formulaires
  end

end
