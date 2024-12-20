require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { FactoryBot.create(:tag) }

  describe "バリデーションのテスト" do
    it "有効なタグを作成できる" do
      expect(tag).to be_valid
    end

    it "タグ名は必須である" do
      tag.name = " "
      expect(tag).to_not be_valid
    end
  end
end
