class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user, foreign_key: :author_id
end
