require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let(:subject) { build(:subject, user: user) }

    it 'すべての必須フィールドが存在する場合、有効である' do
      expect(subject).to be_valid
    end

    it '名前が空の場合、無効である' do
      subject.name = ''
      expect(subject).not_to be_valid
    end

    it '名前が100文字を超える場合、無効である' do
      subject.name = 'a' * 101
      expect(subject).not_to be_valid
    end

    it '単位数が空の場合、無効である' do
      subject.credits = nil
      expect(subject).not_to be_valid
    end

    it '単位数が負の場合、無効である' do
      subject.credits = -1
      expect(subject).not_to be_valid
    end

    it '単位数が整数でない場合、無効である' do
      subject.credits = 1.5
      expect(subject).not_to be_valid
    end

    it 'カテゴリが空の場合、無効である' do
      subject.category = ''
      expect(subject).not_to be_valid
    end

    it 'カテゴリが指定された値以外の場合、無効である' do
      subject.category = 'その他'
      expect(subject).not_to be_valid
    end
  end

  describe '関連のテスト' do
    it 'ユーザーに関連付けられている場合、有効である' do
      subject = create(:subject)
      expect(subject.user).to be_present
    end
  end
end
