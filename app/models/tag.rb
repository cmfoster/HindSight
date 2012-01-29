class Tag < ActiveRecord::Base
  has_many :taggables
  has_many :posts, :through => :taggables
  
  def use_count
    Tag.where('subject = ?', self.subject).count
  end
  
  def self.used
    Tag.count(:group => :subject, :order =>'count_all DESC')
  end
  
  def self.postnumber(subject) #used to find true posts numbers
      taggroup = Tag.where('subject = ?', subject).clone
      postnum = 0
      if taggroup
	taggroup.each do |otag|
	  postnum += otag.posts.count
	end
      end
    return postnum
  end
  
  def postids
    self.posts.each do |post|
      post.id
    end
  end
  
end

#a.each_key{|key| puts key}

