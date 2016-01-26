class User < ActiveRecord::Base
  has_many :users_groups
  has_many :groups, through: :users_groups
  has_many :users_documents
  has_many :completed_documents, through: :users_documents, source: :documents

  has_secure_password
end
