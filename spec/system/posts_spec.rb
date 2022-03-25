require 'rails_helper'

RSpec.describe Post, type: :system do


  describe '投稿のテスト' do

      let(:user) { FactoryBot.create(:user, name: 'test')}
      let!(:post) { FactoryBot.build(:post, user: user) }


    before do
      visit new_user_session_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    describe 'navberへの表示テスト' do
      context '表示の確認' do
        it '投稿すると表示される' do
          expect(page).to have_content '投稿する >'
          expect(current_path).to eq posts_path
        end
      end
    end

    describe '投稿のテスト' do
      context '新規投稿ページへ遷移' do
        it '遷移する' do
          click_on '投稿'
          expect(page).to have_content '新規投稿'
          expect(current_path).to eq new_post_path
        end
      end

      context '表示の確認' do
        before do
          visit new_post_path
        end
          it 'タイトルフォームが表示される' do
            expect(page).to have_field 'post_title'
          end
          it '製作期間フォームが表示される' do
            expect(page).to have_field 'post_production_period'
          end
          it '製作費用フォームが表示される' do
            expect(page).to have_field 'post_cost'
          end
          it '難易度フォームが表示される' do
            expect(page).to have_field 'post_difficulty'
          end
          it '説明フォームが表示される' do
            expect(page).to have_field  'post_explanation'
          end
          it '投稿ボタンが表示される' do
            expect(page).to have_button '投稿'
          end
      end
    end
  end
end
