class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
    	t.text :content
    	t.references :group

      t.timestamps null: false
    end
  end
end
