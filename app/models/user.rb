class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :user_technologies
  has_many :technologies, through: :user_technologies
  has_many :articles, dependent: :destroy
  has_many :comments

  acts_as_messageable
 
  def mailboxer_name
    self.name
  end
 
  def mailboxer_email(object)
    self.email
  end

  def feed
    tech_ids = "SELECT technology_id FROM user_technologies where user_id = #{self.id}"
    #Article.where("user_id = ?", id)
    Article.where("technology_id IN (#{tech_ids}) 
                      OR user_id = :user_id", user_id: id)
  end

end