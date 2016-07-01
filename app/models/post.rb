class Post < ActiveRecord::Base
  has_many :taggings
  has_many :tag, through: :taggings

  validates :subject,  presence: true
  validates :description,  presence: true
end
