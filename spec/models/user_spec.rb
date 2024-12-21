require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }

    it 'すべての必須フィールドが存在する場合、有効である' do
      expect(user).to be_valid
    end

    it 'ニックネームが空の場合、無効である' do
      user.nickname = ''
      expect(user).not_to be_valid
    end

    it 'ニックネームが50文字を超える場合、無効である' do
      user.nickname = 'a' * 51
      expect(user).not_to be_valid
    end

    it 'メールアドレスが空の場合、無効である' do
      user.email = ''
      expect(user).not_to be_valid
    end

    it 'パスワードが空の場合、無効である' do
      user.password = ''
      expect(user).not_to be_valid
    end

    it 'パスワードが6文字未満の場合、無効である' do
      user.password = '12345'
      expect(user).not_to be_valid
    end
  end

end
