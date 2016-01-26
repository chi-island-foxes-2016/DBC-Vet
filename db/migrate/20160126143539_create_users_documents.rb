class CreateUsersDocuments < ActiveRecord::Migration
  def change
    create_table :users_documents do |t|
    	t.references :user
    	t.references :document
    end
  end
end
