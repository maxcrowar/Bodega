class AddArtistToWorks < ActiveRecord::Migration
  def change
    add_column :works, :artist, :string
  end
end
