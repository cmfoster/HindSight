class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :comment, :name
  validates_presence_of :name, :comment, :post_id
end
