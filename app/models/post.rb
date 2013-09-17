class Post < ActiveRecord::Base

  attr_accessible :user_id, :body, :elipse_ids

  validates :user_id, presence: true

  belongs_to :user,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id

  has_many :post_shares,
  class_name: "PostShare",
  foreign_key: :post_id,
  primary_key: :id

  has_many :friend_elipses, through: :post_shares, source: :friend_elipse
end
