class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :user, null: false

      t.timestamps null: false
    end
  end
end
