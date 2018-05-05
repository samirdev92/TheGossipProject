class Comment < ApplicationRecord
  # Un comment n'appartient qu'a un seul gossip
  belongs_to :gossip
end
