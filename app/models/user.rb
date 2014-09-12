class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: :true
  validates :email, presence: :true
  validates_uniqueness_of :email

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :images
end
