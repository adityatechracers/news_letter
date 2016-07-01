class Tag < ActiveRecord::Base
	has_many :subscriptions
    has_many :users, through: :subscriptions
    has_many :taggings
    has_many :posts, through: :taggings

    validates :name,  presence: true


end
