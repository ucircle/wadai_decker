class AddBookmarksCountToTopics < ActiveRecord::Migration[6.1]
  def change
    add_column :topics, :bookmarks_count, :integer
  end
end
