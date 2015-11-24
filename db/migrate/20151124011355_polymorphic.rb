class Polymorphic < ActiveRecord::Migration
  def change
    drop_table :user_comments
    drop_table :goal_comments

    create_table :comments do |t|
      t.timestamps
      t.string :title, null: false
      t.string :body, null: false
      t.references :commentable, polymorphic: true, index: true
    end
  end
end
