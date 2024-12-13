class SubjectsController < ApplicationController
  def index
    @graduation_requirement = GraduationRequirement.first # 必要に応じて変更
    @subjects = current_user.subjects
  end

  def edit
    @subjects = current_user.subjects
  end

end
