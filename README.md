# README

Hello. Pour ce projet, nous avons bossé en groupe avec ma team Courgette (aka Ana, Paul, Olivier et Richard).

1. Git clone ou download ce repo.
2. Fais bundle install --without production

Le but de cette app est de créer une ébauche de blog, où chacun peut rentrer un/des gossips et/ou commenter ceux des autres.

Pour cela, nous avons:

1. Crée deux modèles (Gossip et comment. Un gossip (//article) peut avoir plusieurs comments mais un comment n'appartient qu'à un seul gossip)
2. Crée trois controllers (static_pages, gossips et comments), car ils vont faire appel à des routes différentes.
3. Crée nos routes: les URL des commentaires étant logiquement dépendantes de celles des gossips, nous avons fait appel à des nested routes.

Sur notre blog, tu pourras:
1. Accéder à la page principale et choisir ce que tu veux faire (index des gossips, nouveau gossip)
2. Ecrire tes gossips
3. Sur la page de chaque gossip, soit voir son recap (contenu + commentaires) soit aller vers le lien d'édition
4. Sur la page d'édition, tu peux aussi le supprimer.
5. Pour chaque gossip, tu peux laisser un commentaire.
6. Tu peux retrouver la liste de tous les commentaires d'un article sous le gossip en question.
7. Tu peux éditer ou supprimer ton commentaire.
8. Tu peux revenir à l'index
9. L'index t'indique tous les gossips et leur nombre de commentaires

Plus de détails dans les sous-dossiers.

Tu trouveras mon lien Heroku ici: https://enigmatic-island-56606.herokuapp.com/
