class CreateJoinTableProjectsMaterials < ActiveRecord::Migration
  def change
    create_join_table :projects, :materials do |t|
      t.index [:project_id, :material_id]
      t.index [:material_id, :project_id]
    end
  end
end
