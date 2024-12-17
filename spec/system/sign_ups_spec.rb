require 'rails_helper'

RSpec.describe "ユーザー登録機能", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "ユーザー情報を入力し登録ボタンを押すと、承認メールを送信する" do
    visit signup_path

    fill_in "お名前", with: "テストユーザー"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "password"
    fill_in "パスワード再確認", with: "password"

    click_button "登録"

    expect(page).to \
      have_content "アカウント認証用のメールを送信しました！確認してください。"
    expect(current_path).to eq root_path

    mail = ActionMailer::Base.deliveries.last

    aggregate_failures do
      expect(mail.to).to eq ["test@example.com"]
      expect(mail.from).to eq ["from@example.com"]
      expect(mail.subject).to eq "アカウント認証"
      expect(html_body(mail)).to match "こんにちは、テストユーザーさん！"
      expect(html_body(mail)).to match "アカウントを有効化"
    end
  end
end
