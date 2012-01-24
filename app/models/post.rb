class Post < ActiveRecord::Base
  validates_presence_of :story, :title
  belongs_to :user
  has_many :taggables
  has_many :tags, :through => :taggables
  has_many :comments
  acts_as_voteable
end
