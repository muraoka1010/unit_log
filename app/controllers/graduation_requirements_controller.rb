class GraduationRequirementsController < ApplicationController
  def new
    @graduation_requirement = GraduationRequirement.new
  end

  def create
    @graduation_requirement = GraduationRequirement.new(graduation_requirement_params)
    if @graduation_requirement.save
      redirect_to subjects_path, notice: '卒業要件が設定されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @graduation_requirement = GraduationRequirement.find(params[:id])
  end

  def update
    @graduation_requirement = GraduationRequirement.find(params[:id])
    if @graduation_requirement.update(graduation_requirement_params)
      redirect_to subjects_path, notice: '卒業要件が更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def graduation_requirement_params
    params.require(:graduation_requirement).permit(:category_id, :required_credits)
  end
end
