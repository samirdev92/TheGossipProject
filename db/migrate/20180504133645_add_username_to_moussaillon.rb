class AddUsernameToMoussaillon < ActiveRecord::Migration[5.2]
  def change
    add_column :moussaillons, :username, :string
  end
end
