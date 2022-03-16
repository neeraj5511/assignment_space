class User < ApplicationRecord
  has_secure_password
  has_many :blog_posts
  has_many :active_relationships, class_name:  "Relationship",foreign_key: "follower_id",dependent: :destroy
  has_many :followeds, through: :active_relationships
  has_many :followers, through: :passive_relationships, source: :follower
  def welcome
    "Hello, #{self.email}!"
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    Blogpost.where("user_id = ?", id)
  end
end
