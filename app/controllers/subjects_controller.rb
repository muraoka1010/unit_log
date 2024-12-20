class SubjectsController < ApplicationController
  before_action :set_subject, only: [:edit, :update, :destroy]

  def index
    @graduation_requirement = GraduationRequirement.first_or_initialize
    @subjects = current_user.subjects
  
    if @graduation_requirement.nil?
      flash[:alert] = "卒業要件が設定されていません。"
      redirect_to new_graduation_requirement_path and return
    end
  
    # 各科目カテゴリごとの合計単位数
    @total_core_credits = @subjects.where(category: '必修').sum(:credits)
    @total_elective_credits = @subjects.where(category: '選択').sum(:credits)
    @total_free_credits = @subjects.where(category: '自由').sum(:credits)

    # 残り単位数の計算
    @remaining_core_credits = [@graduation_requirement.required_core_credits - @total_core_credits, 0].max
    @remaining_elective_credits = [@graduation_requirement.elective_credits - @total_elective_credits, 0].max
    @remaining_free_credits = [@graduation_requirement.free_credits - @total_free_credits, 0].max
    @remaining_total_credits = [
       @graduation_requirement.required_credits - (@total_core_credits + @total_elective_credits + @total_free_credits),
       0
      ].max
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
