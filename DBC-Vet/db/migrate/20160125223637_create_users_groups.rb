class CreateUsersGroups < ActiveRecord::Migration
  def change
    create_table :users_groups do |t|
      t.references :user, index: true
      t.references :group, index: true

      t.timestamps null: false
    end
    add_foreign_key :users_groups, :users
    add_foreign_key :users_groups, :groups
  end
end
