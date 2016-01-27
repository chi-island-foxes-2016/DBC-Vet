class UsersGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  # validates :user, uniqueness: {scope: :username}

 	#validates_uniqueness_of :user_id
end
