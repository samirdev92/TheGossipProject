class RemoveAnonymousAuthorFromGossips < ActiveRecord::Migration[5.2]
  def change
  	remove_column :gossips, :anonymous_author, :string
  end
end
