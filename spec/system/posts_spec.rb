require 'rails_helper'

RSpec.describe Post, type: :system do
  @user = FactoryBot.create(:user)
  let(:post) { create(:post) }
  before do
    sign_in(:user)
  end

  describe '新規投稿' do
    context 'フォームの入力値が正常' do
      it '新規投稿成功' do
        # 投稿一覧画面へ遷移
        visit new_post_path
        fill_in 'post[title]', with: post.title
        fill_in 'post[production_period]', with: post.production_period
        fill_in 'post[cost]', with: post.cost
        fill_in 'post[explanation]', with: post.explanation
        fill_in 'post[difficulty]', with: post.difficulty
        click_button '投稿'
        # posts_pathへ遷移する事を期待する
        expect(current_path).to eq posts_path
      end
    end

    context '画像投稿未入力' do
      it '新規投稿失敗' do
        visit new_post_path
        fill_in 'post[title]', with: post.title
        fill_in 'post[production_period]', with: post.production_period
        fill_in 'post[cost]', with: post.cost
        fill_in 'post[explanation]', with: post.explanation
        fill_in 'post[difficulty]', with: post.difficulty
        click_button '投稿'
        expect(current_path).to eq new_post_path
        expect(page).to have_content "Photoを入力してください"
      end
    end

    context 'タイトル未入力' do
      it '新規投稿失敗' do
        fill_in 'post[title]', with: nil
        fill_in 'post[production_period]', with: post.production_period
        fill_in 'post[cost]', with: post.cost
        fill_in 'post[explanation]', with: post.explanation
        fill_in 'post[difficulty]', with: post.difficulty
        click_button '投稿'
        expect(current_path).to eq new_post_path
        expect(current_path).to have_content "Titleを入力してください"
      end
    end

    context '製作期間未入力' do
      it '新規投稿失敗' do
        fill_in 'post[title]', with: post.title
        fill_in 'post[production_period]', with: nil
        fill_in 'post[cost]', with: post.cost
        fill_in 'post[explanation]', with: post.explanation
        fill_in 'post[difficulty]', with: post.difficulty
        click_button '投稿'
        expect(current_path).to eq new_post_path
        expect(page).to have_content "ProductionPeriodを入力してください"
      end
    end

    context '製作費用未入力' do
      it '新規投稿失敗' do
        fill_in 'post[title]', with: post.title
        fill_in 'post[production_period]', with: post.production_period
        fill_in 'post[cost]', with: nil
        fill_in 'post[explanation]', with: post.explanation
        fill_in 'post[difficulty]', with: post.difficulty
        click_button '投稿'
        expect(current_path).to eq new_post_path
        expect(page).to have_content "Costを入力してください"
      end
    end

    context '難易度未入力' do
      it '新規投稿失敗' do
        fill_in 'post[title]', with: post.title
        fill_in 'post[production_period]', with: post.production_period
        fill_in 'post[cost]', with: post.cost
        fill_in 'post[explanation]', with: post.explanation
        fill_in 'post[difficulty]', with: nil
        click_button '投稿'
        expect(current_path).to eq new_post_path
        expect(page).to have_content "Difficultyを入力してください"
      end
    end

    context '説明未入力' do
      it '新規投稿失敗' do
        fill_in 'post[title]', with: post.title
        fill_in 'post[production_period]', wit: post.production_period
        fill_in 'post[cost]', with: post.cost
        fill_in 'post[explanation]', with: nil
        fill_in 'post[difficulty]', with: post.difficulty
        click_button '投稿'
        expect(current_path).to eq new_post_path
        expect(page).to have_content "Explanationを入力してください"
      end
    end
  end
end