class Relationship < ApplicationRecord
  
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
  #バリデーションは付けるのか？一人に対して一つしかフォローできないみたいな
  #validates :follower_id, uniqueness: {scope: :followed_id}
  
end
