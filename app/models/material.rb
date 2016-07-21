class Material < ActiveRecord::Base
  has_many :materials_projects
  has_many :projects, through: :materials_projects

end
