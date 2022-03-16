    require 'rails_helper'

    RSpec.describe User, type: :system do
      let(:user) { create(:user) }
      let(:other_user) { create(:user) }

      describe 'User CRUD' do

        describe 'ログイン前' do
          describe 'ユーザー新規登録' do
            context 'フォームの入力値が正常' do
              it 'ユーザー新規登録成功' do
                #ユーザーの新規登録画面へ遷移
                visit new_user_registration_path
                # Nameテキストフィールドにユーザーテストと入力
                fill_in 'user[name]', with: 'テストユーザー'
                # Emailテキストフィールドにtest@example.comと入力
                fill_in 'user[email]', with: 'test@example.com'
                # Passwordテキストフィールドにpasswordと入力
                fill_in 'user[password]', with: 'password'
                # Password confirmationテキストフィールドにpasswordと入力
                fill_in 'user[password_confirmation]', with: 'password'
                # 登録と記述のあるsubmitをクリックする
                click_button '登録'
                # posts_pathへ遷移することを期待する
                expect(current_path).to eq posts_path
              end
            end

            context 'ユーザー名' do
              it 'ユーザー新規登録失敗' do
                visit new_user_registration_path
                fill_in 'user[name]', with: nil
                fill_in 'user[email]', with: user.email
                fill_in 'user[password]', with: 'password'
                fill_in 'user[password_confirmation]', with: 'password'
                click_button '登録'
                expect(current_path).to eq user_registration_path
              end
            end

            context 'メール未入力' do
              it 'ユーザー新規登録失敗' do
                visit new_user_registration_path
                fill_in 'user[name]', with: user.name
                fill_in 'user[email]', with: nil
                fill_in 'user[password]', with: 'password'
                fill_in 'user[password_confirmation]', with: 'password'
                click_button '登録'
                expect(current_path).to eq user_registration_path
              end
            end

            context 'パスワード未入力' do
              it 'ユーザー新規登録失敗' do
                visit new_user_registration_path
                fill_in 'user[name]', with: user.name
                fill_in 'user[email]', with: user.email
                fill_in 'user[password]', with: nil
                fill_in 'user[password_confirmation]', with: 'password'
                click_button '登録'
                expect(current_path).to eq user_registration_path
              end
            end

            context '確認パスワード未入力' do
              it 'ユーザー新規登録失敗' do
                visit new_user_registration_path
                fill_in 'user[name]', with: user.name
                fill_in 'user[email]', with: user.email
                fill_in 'user[password]', with: user.password
                fill_in 'user[password_confirmation]', with: nil
                click_button '登録'
                expect(current_path).to eq user_registration_path
              end
            end

            context '登録済みユーザー名' do
              it 'ユーザー新規登録失敗' do
                visit new_user_registration_path
                fill_in 'user[name]', with: user.name
                fill_in 'user[email]', with: user.email
                fill_in 'user[password]', with: 'password'
                fill_in 'user[password_confirmation]', with: 'password'
                click_button '登録'
                expect(current_path).to eq users_path
                expect(page).to have_content "Nameはすでに存在します"
              end
            end

            context '登録済みメールアドレス' do
              it 'ユーザー新規登録失敗' do
                visit new_user_registration_path
                fill_in 'user[name]', with: user.name
                fill_in 'user[email]', with: user.email
                fill_in 'user[password]', with: 'password'
                fill_in 'user[password_confirmation]', with: 'password'
                click_button '登録'
                expect(current_path).to eq users_path
                expect(page).to have_content "Eメールはすでに存在します"
              end
            end
          end
        end
      end
    end