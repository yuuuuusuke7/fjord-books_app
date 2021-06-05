# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:alice_report)

    visit root_path
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'テストについて学ぶ'
    fill_in '内容', with: 'テストは大切'
    click_on '登録する'

    assert_text '日報が作成されました。'
    click_on '戻る'
  end

  test 'updating a Report' do
    visit reports_url
    click_link '編集'

    fill_in 'タイトル', with: 'Mini test'
    fill_in '内容', with: 'test first'
    click_on '更新する'

    assert_text '日報が更新されました。'
    click_on '戻る'
  end

  test 'destroying a Book' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
  end
end
