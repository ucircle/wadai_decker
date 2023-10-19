class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :topic
  
  # ブックマークを追加したときにトピックの bookmarks_count を増やす
  after_create do
    topic.update(bookmarks_count: topic.bookmarks_count + 1)
  end

  # ブックマークを削除したときにトピックの bookmarks_count を減らす
  after_destroy do
    topic.update(bookmarks_count: topic.bookmarks_count - 1)
  end
end
