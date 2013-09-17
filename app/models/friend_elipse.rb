class FriendElipse < ActiveRecord::Base

  attr_accessible :stalker_id, :name, :member_ids

  validates_presence_of :name, :stalker_id

  belongs_to(
    :stalker,
    class_name: "User",
    foreign_key: :stalker_id,
    primary_key: :id
  )

  has_many(
    :memberships,
    class_name: "FriendElipseMembership",
    foreign_key: :elipse_id,
    primary_key: :id
  )

  has_many :members, through: :memberships, source: :victim



end
