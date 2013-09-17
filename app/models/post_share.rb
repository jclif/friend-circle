class PostShare < ActiveRecord::Base
  attr_accessible :post_id, :friend_elipse_id

  validates_uniqueness_of :post_id, scope: :friend_elipse_id

  belongs_to :post,
  class_name: "Post",
  primary_key: :id,
  foreign_key: :post_id

  belongs_to :friend_elipse,
  class_name: "FriendElipse",
  primary_key: :id,
  foreign_key: :friend_elipse_id

end
