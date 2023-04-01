class UsersGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :users_groups do |t|
      t.belongs_to :user
      t.belongs_to :group
    end
  end
end
