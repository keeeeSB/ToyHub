require 'rails_helper'

RSpec.describe "ログイン機能", type: :system do
  let(:user) { FactoryBot.create(:user) }

  scenario "ユーザーがログインできる" do
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect(page).to \
      have_content "ログインしました。"
    expect(current_path).to eq user_path(user)
  end
end
