class Project < ActiveRecord::Base
  belongs_to :user
  has_many :material_projects
  has_many :materials, through: :material_projects
  validates_presence_of :title, :description
  mount_uploader :image, ImageUploader

  # def material_name=(name)
  #     self.material = Material.find_or_create_by(name: name)
  # end

  def materials_attributes=(material_attributes)
    material_attributes.values.each do |material_attribute|
      material = Material.find_or_create_by(material_attribute)
      self.materials << material
    end
  end


end
