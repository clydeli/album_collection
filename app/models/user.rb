class User < ActiveRecord::Base
  has_and_belongs_to_many :albums
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body

  validates :username, presence: true, uniqueness: true, length: { minimum: 5 }
  #validates_presence_of :username
  #validates_uniqueness_of :username
end
