class Project < ActiveRecord::Base
  belongs_to :user
  has_many :materials_projects
  has_many :materials, through: :materials_projects

  # def materials

  # end
end
