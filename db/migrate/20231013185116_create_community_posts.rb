class CreateCommunityPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :community_posts do |t|
      t.references :community, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :issue
      t.string :body
      t.string :image

      t.timestamps
    end
  end
end
