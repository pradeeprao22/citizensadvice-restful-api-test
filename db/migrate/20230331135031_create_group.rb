class CreateGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :group_name, unique: true

      t.timestamps
    end
  end
end
