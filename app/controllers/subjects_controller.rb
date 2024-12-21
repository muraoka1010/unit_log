class SubjectsController < ApplicationController
  before_action :set_subject, only: [:edit, :update, :destroy]
  before_action :authenticate_user! # Deviseのヘルパーでログインをチェック
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @graduation_requirement = GraduationRequirement.find_or_initialize_by(user_id: current_user)
    @subjects = current_user.subjects
  
    # 各科目カテゴリごとの合計単位数
    @total_core_credits = @subjects.where(category: '必修').sum(:credits)
    @total_elective_credits = @subjects.where(category: '選択').sum(:credits)
    @total_free_credits = @subjects.where(category: '自由').sum(:credits)
  
    # 卒業要件が未設定の場合にデフォルト値を使用
    required_credits = @graduation_requirement.required_credits || 124
    required_core_credits = @graduation_requirement.required_core_credits || 62
    elective_credits = @graduation_requirement.elective_credits || 30
    free_credits = @graduation_requirement.free_credits || 32
  
    # 残り単位数の計算
    @remaining_core_credits = [required_core_credits - @total_core_credits, 0].max
    @remaining_elective_credits = [elective_credits - @total_elective_credits, 0].max
    @remaining_free_credits = [free_credits - @total_free_credits, 0].max
    @remaining_total_credits = [
      required_credits - (@total_core_credits + @total_elective_credits + @total_free_credits),
      0
    ].max
  
    # 卒業要件が未設定の場合にアラートを表示してリダイレクト
    if @graduation_requirement.new_record?
      flash[:alert] = "卒業要件が設定されていません。"
      redirect_to new_graduation_requirement_path and return
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

  def authorize_user
    subject = Subject.find(params[:id]) # 例: `params[:id]` を使う場合
    unless subject.user == current_user
      flash[:alert] = "アクセス権限がありません。"
      redirect_to root_path
    end
  end

end
