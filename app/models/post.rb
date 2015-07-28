class Post < ActiveRecord::Base
  acts_as_votable

	belongs_to :user

	validates_presence_of :title, :description, :picture
	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

	def author
		self.user.username
	end

	def added_on
    self.created_at.strftime("%d-%m-%Y")
	end
end
