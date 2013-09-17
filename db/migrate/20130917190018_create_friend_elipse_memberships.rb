class CreateFriendElipseMemberships < ActiveRecord::Migration

  def change
    create_table :friend_elipse_memberships do |t|
      t.integer :elipse_id, null: false
      t.integer :victim_id, null: false

      t.timestamps
    end
  end

end
