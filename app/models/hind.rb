class Hind < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :subject
end
