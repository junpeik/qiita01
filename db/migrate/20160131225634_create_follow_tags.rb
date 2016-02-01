class CreateFollowTags < ActiveRecord::Migration
  def change
    create_table :follow_tags do |t|
      t.references :user, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :follow_tags, [:user_id, :tag_id], unique: true
  end
end
