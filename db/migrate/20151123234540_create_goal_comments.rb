class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|

      t.timestamps null: false
    end
  end
end
