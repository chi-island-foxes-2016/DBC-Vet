class DocumentsGroup < ActiveRecord::Base
	belongs_to :document
	belongs_to :group
end
