class Document < ActiveRecord::Base
	belongs_to :group
	has_many :document_groups

  validates :title, presence: true
  validates :group_id, presence: true
  validates :content, presence: true
end
