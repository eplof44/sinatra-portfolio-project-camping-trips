class User < ActiveRecord::Base
  has_secure_password
  has_many :campingtrip

  def find_by_slug(slug)
       self.all.find{|x| x.slug == slug}
  end

  def slug
       username.downcase.gsub(" ", "-")
  end


end
