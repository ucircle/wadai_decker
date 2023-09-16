class CreateJoinTableTopicsTags < ActiveRecord::Migration[6.1]
  def change
    create_join_table :topics, :tags
  end
end
