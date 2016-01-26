class CreateDocumentsGroups < ActiveRecord::Migration
  def change
    create_table :documents_groups do |t|
    	t.references :document
    	t.references :group
    end
  end
end
