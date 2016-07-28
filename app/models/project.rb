class Project < ActiveRecord::Base
  belongs_to :user
  has_many :material_projects
  has_many :materials, through: :material_projects
  validates_presence_of :title, :description
  mount_uploader :image, ImageUploader

  def set_user_id!(user)
    self.user_id = user.id
    self.save!
  end

  def materials_attributes=(material_attributes)
    material_attributes.values.each do |materials_attributes|
      unless !materials_attributes.blank?
        material = Material.find_or_create_by(material_attribute)
        self.materials << material
      end
    end
  end

  def date_string
    self.created_at.strftime("%b %e, %l:%M %p")
  end


end
