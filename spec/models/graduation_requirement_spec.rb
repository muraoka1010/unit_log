require 'rails_helper'

RSpec.describe GraduationRequirement, type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let(:graduation_requirement) { build(:graduation_requirement, user: user) }

    it 'すべての必須フィールドが存在する場合、有効である' do
      expect(graduation_requirement).to be_valid
    end

    it 'ユーザーが関連付けられていない場合、無効である' do
      graduation_requirement.user = nil
      expect(graduation_requirement).not_to be_valid
    end

    it '必須単位数が空の場合、無効である' do
      graduation_requirement.required_credits = nil
      expect(graduation_requirement).not_to be_valid
    end

    it '必須単位数が負の場合、無効である' do
      graduation_requirement.required_credits = -1
      expect(graduation_requirement).not_to be_valid
    end

    it '必須単位数が整数でない場合、無効である' do
      graduation_requirement.required_credits = 124.5
      expect(graduation_requirement).not_to be_valid
    end

    it '必須単位数の合計が一致しない場合、無効である' do
      graduation_requirement.required_core_credits = 60
      expect(graduation_requirement).not_to be_valid
      expect(graduation_requirement.errors[:required_credits]).to include(
        "合計単位数 (122) が必要単位数 (124) と一致しません"
      )
    end
  end

  describe '関連のテスト' do
    it 'ユーザーに関連付けられている場合、有効である' do
      graduation_requirement = create(:graduation_requirement)
      expect(graduation_requirement.user).to be_present
    end
  end
end

