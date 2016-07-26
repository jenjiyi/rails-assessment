class DropPets < ActiveRecord::Migration
  def change
    drop_table :pets
  end
end
