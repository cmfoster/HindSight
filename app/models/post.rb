class Post < ActiveRecord::Base
  validates_presence_of :story, :title
  belongs_to :user
  has_many :taggables, :dependent => :destroy
  has_many :tags, :through => :taggables, :dependent => :destroy
  accepts_nested_attributes_for :tags
  has_many :comments
  acts_as_voteable
end
