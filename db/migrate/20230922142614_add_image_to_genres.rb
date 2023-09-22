class AddImageToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :image, :string
  end
end
