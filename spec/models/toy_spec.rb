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

  describe "#assign_tags" do
    it "半角スペースで区切られたタグを保存する" do
      toy.assign_tags("スポーツ 球技")
      expect(toy.tags.map(&:name)).to contain_exactly("スポーツ", "球技")
    end

    it "全角スペースで区切られたタグを保存する" do
      toy.assign_tags("スポーツ　球技")
      expect(toy.tags.map(&:name)).to contain_exactly("スポーツ", "球技")
    end

    it "半角と全角スペースが混同していても、正しく分割して保存する" do
      toy.assign_tags("スポーツ 球技　アウトドア")
      expect(toy.tags.map(&:name)).to contain_exactly("スポーツ", "球技", "アウトドア")
    end
  end
end
