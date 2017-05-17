class AddIndexToActors < ActiveRecord::Migration[5.0]
  def up
    add_index :actors, [:first_name, :last_name], name: 'name_index'
  end

  def down
    remove_index :actors, name: 'name_index'
  end
end
