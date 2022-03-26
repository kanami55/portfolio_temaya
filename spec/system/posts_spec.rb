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
            expect(page).to click_on 'review_star'
          end
          it '説明フォームが表示される' do
            expect(page).to have_field  'post_explanation'
          end
          it '投稿ボタンが表示される' do
            expect(page).to have_button '投稿'
          end
      end

      context 'フォームの入力値が正常' do
        it '新規投稿成功' do
          # 投稿一覧画面へ遷移
          visit new_post_path
          fill_in 'post_title', with: post.title
          fill_in 'post_production_period', with: post.production_period
          fill_in 'post_cost', with: post.cost
          fill_in 'post_explanation', with: post.explanation
          click_button '投稿'
          # posts_pathへ遷移する事を期待する
          expect(current_path).to eq posts_path
        end
      end

      context 'タイトル未入力' do
        it '新規投稿失敗' do
          fill_in "post['タイトル:']", with: ""
          fill_in "post['製作期間:']", with: post.production_period
          fill_in "post['製作費用:']", with: post.cost
          fill_in "post['説明:']", with: post.explanation

          click_button '投稿'
          expect(current_path).to eq new_post_path
          expect(current_path).to have_content "Titleを入力してください"
        end
      end

      context '製作期間未入力' do
        it '新規投稿失敗' do
          fill_in 'post_title', with: post.title
          fill_in 'post_production_period', with: ""
          fill_in 'post_cost', with: post.cost
          fill_in 'post_explanation', with: post.explanation
          fill_in 'post_difficulty', with: post.difficulty
          click_button '投稿'
          expect(current_path).to eq new_post_path
          expect(page).to have_content "ProductionPeriodを入力してください"
        end
      end

      context '製作費用未入力' do
        it '新規投稿失敗' do
          fill_in 'post_title', with: post.title
          fill_in 'post_production_period', with: post.production_period
          fill_in 'post_cost', with: ""
          fill_in 'post_explanation', with: post.explanation
          fill_in 'post_difficulty', with: post.difficulty
          click_button '投稿'
          expect(current_path).to eq new_post_path
          expect(page).to have_content "Costを入力してください"
        end
      end

      context '難易度未入力' do
        it '新規投稿失敗' do
          fill_in 'post_title', with: post.title
          fill_in 'post_production_period', with: post.production_period
          fill_in 'post_cost', with: post.cost
          fill_in 'post_explanation', with: post.explanation
          fill_in 'post_difficulty', with: ""
          click_button '投稿'
          expect(current_path).to eq new_post_path
          expect(page).to have_content "Difficultyを入力してください"
        end
      end

      context '説明未入力' do
        it '新規投稿失敗' do
          fill_in 'post_title', with: post.title
          fill_in 'post_production_period', wit: post.production_period
          fill_in 'post_cost', with: post.cost
          fill_in 'post_explanation', with: ""
          click_button '投稿'
          expect(current_path).to eq new_post_path
          expect(page).to have_content "Explanationを入力してください"
        end
      end
    end
  end
end
