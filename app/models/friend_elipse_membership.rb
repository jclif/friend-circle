class FriendElipseMembership < ActiveRecord::Base

  attr_accessible :elipse_id, :victim_id

  validates_uniqueness_of :elipse_id, :victim_id

  belongs_to(
    :elipse,
    class_name: "FriendElipse",
    foreign_key: :elipse_id,
    primary_key: :id,
  )

  belongs_to(
    :victim,
    class_name: "User",
    foreign_key: :victim_id,
    primary_key: :id,
  )

end
