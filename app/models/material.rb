class Material < ActiveRecord::Base
  has_many :material_projects
  has_many :projects, through: :material_projects

   validates_uniqueness_of :name
end
