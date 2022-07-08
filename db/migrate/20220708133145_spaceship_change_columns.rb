class SpaceshipChangeColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :spaceships, :type
    add_column :spaceships, :manufacturer, :string
  end
end
