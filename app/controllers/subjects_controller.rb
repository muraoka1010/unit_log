class SubjectsController < ApplicationController
  before_action :set_subject, only: [:edit, :update, :destroy]

  def index
    @graduation_requirement = GraduationRequirement.first_or_initialize
    @subjects = current_user.subjects
    if @graduation_requirement.nil?
      flash[:alert] = "卒業要件が設定されていません。"
      redirect_to new_graduation_requirement_path
    end
  end


  def new
    @subject = Subject.new
  end

  def create
    @subject = current_user.subjects.build(subject_params)
    if @subject.save
      redirect_to subjects_path, notice: "#{@subject.name} が作成されました。"
    else
      flash.now[:alert] = "科目の作成に失敗しました。内容を確認してください。"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @subjects = current_user.subjects
  end

  def destroy
    @subject.destroy
    redirect_to subjects_path, notice: "#{@subject.name} を削除しました。"
  end

  def update
    if @subject.update(subject_params)
      redirect_to subjects_path, notice: 'Subject was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_subject
    @subject = current_user.subjects.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :credits, :category)
  end

end
