class AddBirthDayToActors < ActiveRecord::Migration[5.0]
  def up
    add_column :actors, :birthday, :date
    change_column :actors, :first_name, :string, limit: 20, null: false
    change_column :actors, :last_name, :string, limit: 20, null: false
  end

  def down
    remove_column :actors, :birthday
    change_column :actors, :first_name, :string, null: false
    change_column :actors, :last_name, :string, null: false
  end
end
