class Project < ActiveRecord::Base
  belongs_to :user
  has_many :material_projects
  has_many :materials, through: :material_projects
  validates_presence_of :title, :description

  def material_name=(name)
      self.material = Material.find_or_create_by(name: name)
  end

  
end
