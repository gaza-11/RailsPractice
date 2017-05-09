class AddBirthDayToActors < ActiveRecord::Migration[5.0]
  def change
    add_column :actors, :birthday, :date
    change_column :actors, :first_name, :string, limit: 20, null: false
    change_column :actors, :last_name, :string, limit: 20, null: false
  end
end
