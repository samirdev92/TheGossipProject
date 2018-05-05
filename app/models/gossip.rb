class Gossip < ApplicationRecord
  belongs_to :moussaillon

  # Un gossip peut avoir plein de commentaires differents
  #
  # La condition dependent: :destroy permet de supprimer les commentaires
  # associes a des gossips lorsque l'on supprime ces derniers.
  has_many :comments, dependent: :destroy

  # Grace a nos conditions de validation, un user doit indiquer:
  # son nom et un contenu.
  validates :moussaillon, presence: true
  validates :content, presence: true
end
