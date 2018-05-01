class Comment < ApplicationRecord
	belongs_to :gossip
end

#Un comment n'appartient qu'à un seul gossip