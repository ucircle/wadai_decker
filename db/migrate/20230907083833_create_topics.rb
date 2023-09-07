class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|

      t.timestamps
      t.string :title
    end
  end
end
