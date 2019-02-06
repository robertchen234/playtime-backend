class UserSerializer < ActiveModel::Serializer
  has_many :player_posts
  has_many :friend_posts

  has_many :comments

  attributes :id, :first_name, :last_name, :username, :email, :city, :school, :work, :friends, :lvl, :exp, :energy, :max_energy, :speed, :profile_img, :cover_img
end
