require 'rails_helper'

def basic_pass(path) 
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'ツイート投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ツイート投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('出品する')
      # 投稿ページに移動する
      visit new_item_path
      # フォームに情報を入力する
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('item[item_image]', image_path, make_visible: true)
      fill_in 'name', with: @item.name
      fill_in 'explanatory', with: @item.explanatory
      fill_in 'price', with: @item.price
      fill_in 'category', with: @item.category
      fill_in 'status', with: @item.status
      fill_in 'fee', with: @item.fee
      fill_in 'shipmentsource', with: @item.shipmentsource
      fill_in 'timerequired', with: @item.timerequired
      # 送信するとItemモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(1)
      # 投稿完了ページに遷移することを確認する
      expect(current_path).to eq items_path
      # トップページに遷移する
      visit root_path
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
    end
  end
  context '商品出品ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      # 新規投稿ページへのリンクがない
    end
  end
end