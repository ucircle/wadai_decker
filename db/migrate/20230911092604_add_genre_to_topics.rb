class AddGenreToTopics < ActiveRecord::Migration[6.1]
  def change
    add_reference :topics, :genre, null: false, foreign_key: true
  end
end
