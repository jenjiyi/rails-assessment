class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def most_recent_project
    @project = Project.all.most_recent_project
    redirect_to project_path(@project)
  end

end
