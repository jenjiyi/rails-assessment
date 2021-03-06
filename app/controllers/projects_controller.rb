class ProjectsController < ApplicationController 
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :is_authorized?, only: [:edit, :update, :destroy]
   # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @materials = @project.materials.build  
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    # @project.set_user_id!(current_user)
    @project.user_id = current_user.id if current_user
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        puts current_user
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /projects/1
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def is_authorized?
      @project = Project.find(params[:id])
      if current_user != @project.user || !user_signed_in?
        redirect_to project_path(@project), alert: "Access denied."
      end
    end

    def project_params
      params.require(:project).permit(:title, :description, :image, :material_ids => [], :materials_attributes => [:name])
    end

    

end
