class CreateMaterialProjects < ActiveRecord::Migration
  def change
    create_table :material_projects do |t|
      t.integer :project_id
      t.integer :material_id
    end
  end
end
