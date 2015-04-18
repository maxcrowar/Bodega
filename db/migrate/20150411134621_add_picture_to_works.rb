class AddPictureToWorks < ActiveRecord::Migration
  def change
    add_column :works, :picture, :string
  end
end
