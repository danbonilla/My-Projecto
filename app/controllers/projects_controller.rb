class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      # @project.total_material_cost
      redirect_to @project
    end

  end

  def show
    @project = Project.find(params[:id])
  end

    private

  def project_params
    params.require(:project).permit(:wall_height, :wall_perimiter, :area_to_exclude_height, :area_to_exclude_perimiter, :sheet_height, :sheet_width, :sheet_cost, :total_sqft, :sheets_needed, :material_cost)
  end
end
