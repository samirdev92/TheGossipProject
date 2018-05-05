class Gossip < ApplicationRecord
	validates :content, presence: true
	has_many :comments, dependent: :destroy
	belongs_to :moussaillon
end

#Grâce à nos conditions de validation, un user doit indiquer son nom et un contenu

#Un gossip peut avoir plein de commentaires différents

#La condition dependent: :destroy permet de supprimer, sur le site et la BDD, les commentaires des gossips supprimés 