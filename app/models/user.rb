class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   has_many :books,dependent: :destroy
   has_many :book_comments, dependent: :destroy
   has_many :favorites , dependent: :destroy
   
   
   
   
   
   has_many :a_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy#自分がフォローしている人
   has_many :followings, through: :a_relationships, source: :followed
   
   has_many :b_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy#自分をフォローしている人
   has_many :followers, through: :b_relationships, source: :follower
  
  
   def bsanhaanonakaniimasuka?(user)
     a_relationships.exists?(followed_id: user.id)
   end
   
   def a?(user)
     followings.exists?(followed_id: user.id)
   end
  
   
   
  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }



  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
