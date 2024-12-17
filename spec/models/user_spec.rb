require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe "バリデーションのテスト" do
    it "有効なユーザーを作成できる" do
      expect(user).to be_valid
    end

    it "名前は必須である" do
      user.name = " "
      expect(user).to_not be_valid
    end

    it "メールアドレスは必須である" do
      user.email = " "
      expect(user).to_not be_valid
    end

    it "パスワードは必須である" do
      user.password = " "
      expect(user).to_not be_valid
    end

    it "パスワードは最低６文字以上である" do
      user.password = "hello"
      user.password_confirmation = "hello"
      expect(user).to_not be_valid

      user.password = "goodbye"
      user.password_confirmation = "goodbye"
      expect(user).to be_valid
    end
  end
end
