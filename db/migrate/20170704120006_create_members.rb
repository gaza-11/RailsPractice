class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name, limit: 64, null: false
      t.string :hashed_password, null: false
      t.boolean :admin_flag

      t.timestamps
    end
  end
end
