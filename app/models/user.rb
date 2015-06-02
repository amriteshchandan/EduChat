class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }


  has_many :user_technologies
  has_many :technologies, through: :user_technologies


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end