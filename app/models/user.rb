class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true
  validates_format_of :email, :with => /[A-z0-9]+@[A-z]+.[A-z]+/, :message => "Email is invalid"
  validates_uniqueness_of :username, :case_sensitive => false, :message => "That username has already been taken"
  has_many :campingtrip

  def slug
       name.downcase.gsub(" ", "-")
     end
  

  def find_by_slug(slug)
       self.all.find{|x| x.slug == slug}
     end



end
