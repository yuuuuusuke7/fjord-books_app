# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    visit root_path
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: 'すごくわかりやすい！'
    fill_in '著者', with: '五十嵐さん'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'Ruby超入門'
    assert_text 'すごくわかりやすい！'
    assert_text '五十嵐さん'
  end

  test 'updating a Book' do
    visit books_url
    click_link '編集'

    fill_in 'タイトル', with: '楽々ERDレッスン'
    fill_in 'メモ', with: '実在する帳票から本当に使えるテーブル設計を導く画期的な本！'
    fill_in '著者', with: '羽生 章洋'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text '楽々ERDレッスン'
    assert_text '実在する帳票から本当に使えるテーブル設計を導く画期的な本！'
    assert_text '羽生 章洋'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '本が削除されました。'
    assert_not nil, 'プロを目指す人のためのRuby入門'
    assert_not nil, '素晴らしい！！！'
    assert_not nil, '伊藤さん'
  end
end
