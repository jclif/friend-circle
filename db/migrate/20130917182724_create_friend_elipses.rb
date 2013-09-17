class CreateFriendElipses < ActiveRecord::Migration
  def change
    create_table :friend_elipses do |t|
      t.integer :friender_id, null: false
      t.integer :befriended_id, null: false

      t.timestamps
    end

    add_index :friend_elipses, [:friender_id, :befriended_id]
  end
end
