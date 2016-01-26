class Group < ActiveRecord::Base
  has_many :users_groups
  has_many :users, through: :users_groups
  has_many :documents_groups
  has_many :documents
end
