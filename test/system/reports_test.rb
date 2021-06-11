# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_path
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
    assert_selector 'th', text: 'タイトル'
    assert_selector 'th', text: '作成者'
    assert_selector 'th', text: '作成日'
    click_on '詳細', match: :first
    assert_text 'テストについて'
    assert_text 'alice@example.com'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'テストについて学ぶ'
    fill_in '内容', with: 'テストは大切'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'テストについて学ぶ'
    assert_text 'テストは大切'
    assert_text 'alice@example.com'
  end

  test 'updating a Report' do
    visit reports_url
    click_link '編集'

    fill_in 'タイトル', with: 'はじめてのテスト'
    fill_in '内容', with: 'テストファースト！'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text 'はじめてのテスト'
    assert_text 'テストファースト！'
    assert_text 'alice@example.com'
  end

  test 'destroying a Report' do
    visit reports_url
    assert 'テストについて'
    assert_text 'alice@example.com', maximum: 2
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
    assert_no_text 'テストについて'
    assert_text 'alice@example.com', maximum: 1
  end
end
