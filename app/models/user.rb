class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

<<<<<<< HEAD
  has_many :user_technologies
  has_many :technologies, through: :user_technologies

=======
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
>>>>>>> 5b31cad121b6eab29c1b61b85e74ac2cbf271db0
end