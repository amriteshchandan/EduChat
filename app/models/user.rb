class User < ActiveRecord::Base
  rolify
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
    @tech_ids = "SELECT technology_id FROM user_technologies where user_id = #{self.id}"
    #Article.where("user_id = ?", id)
    Article.where("technology_id IN (#{@tech_ids}) 
                      OR user_id = :user_id", user_id: id)
  end

  def user_may_know_other_user
    #arr1 = []
    #self.user_technologies.each do |t|
     # arr1 << UserTechnology.where("technology_id = ?", t)
    #end
    #arr2 =[]
    #arr1.each do |x|
  #    x.each do |y|
  #      arr2 << y[:user_id] # returns user id from Usertechnology table
  #    end
  #  end
  #  arr3 = []
  #  arr2.each do |id|
  #    arr3 << User.where("id = ?", id)
  #  end
  #  arr4 = []
  #  arr3.each do |x|
  #   x.each do |y|
  #      arr4 << y[:name]
  #    end      
  #  end
  #  return arr4.uniq!
    b = "SELECT user_id from user_technologies where technology_id = (#{@tech_ids})"
    User.where("id IN (#{b})", id)
  end
end