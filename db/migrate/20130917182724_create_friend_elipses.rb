class CreateFriendElipses < ActiveRecord::Migration
  def change
    create_table :friend_elipses do |t|
      t.integer :stalker_id, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :friend_elipses, :stalker_id
  end
end
