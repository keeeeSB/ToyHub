require 'rails_helper'

RSpec.describe "おもちゃの登録機能" do
  let(:user) { FactoryBot.create(:user) }

  scenario "ユーザーはおもちゃの登録ができる" do
    log_in_as user

    visit root_path
    click_link "新しいおもちゃを登録"

    expect {
      fill_in "商品名", with: "アンパンマンのぬいぐるみ"
      fill_in "商品説明", with: "アンパンマンのぬいぐるみです。"
      fill_in "値段", with: "1000"
      click_button "登録"
  }.to change(Toy, :count).by(1)

  expect(page).to have_content "おもちゃを登録しました。"
  end
end
