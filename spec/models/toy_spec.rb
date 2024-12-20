require 'rails_helper'

RSpec.describe Toy, type: :model do
  let(:toy) { FactoryBot.create(:toy) }

  describe "バリデーションのテスト" do
    it "有効なおもちゃが作成できる" do
      expect(toy).to be_valid
    end

    it "商品名は必須である" do
      toy.name = " "
      expect(toy).to_not be_valid
    end

    it "説明文は必須である" do
      toy.description = " "
      expect(toy).to_not be_valid
    end

    it "値段は必須である" do
      toy.price = " "
      expect(toy).to_not be_valid
    end
  end
end
