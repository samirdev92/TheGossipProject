class AddMoussaillonToGossips < ActiveRecord::Migration[5.2]
  def change
  	add_reference :gossips, :moussaillon, foreign_key: true
  end
end
