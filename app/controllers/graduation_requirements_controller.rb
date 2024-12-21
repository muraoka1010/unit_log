class GraduationRequirementsController < ApplicationController
  before_action :authenticate_user!  # 未ログイン状態のチェック
  before_action :correct_user, only: [:edit, :update]  # 他のユーザーの卒業要件を編集できないようにする

  def new
    @graduation_requirement = GraduationRequirement.new
  end

  def create
    @graduation_requirement = GraduationRequirement.new(graduation_requirement_params)
    @graduation_requirement.user = current_user  # 現在のユーザーに関連付け

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
    params.require(:graduation_requirement).permit(:required_credits, :required_core_credits, :elective_credits, :free_credits)
  end

  # 現在のユーザーと卒業要件のユーザーが一致するかを確認
  def correct_user
    @graduation_requirement = GraduationRequirement.find(params[:id])
    unless @graduation_requirement.user == current_user
      redirect_to subjects_path, alert: '他のユーザーの卒業要件にはアクセスできません'
    end
  end
end