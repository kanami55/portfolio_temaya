    require 'rails_helper'

    RSpec.describe User, type: :system do
      let(:user) { create(:user) }
      let(:other_user) { create(:user) }

      describe 'User CRUD' do

        describe 'ログイン前' do
          describe 'ユーザー新規登録' do
            context 'フォームの入力値が正常' do
              it 'ユーザーの新規登録が成功' do
                #ユーザーの新規登録画面へ遷移
                visit sign_up_path
                # Nameテキストフィールドにユーザーテストと入力
                fill_in 'Name', with: 'ユーザーテスト'
                # Emailテキストフィールドにtest@example.comと入力
                fill_in 'Email', with: 'test@example.com'
                # Passwordテキストフィールドにpasswordと入力
                fill_in 'Password', with: 'password'
                # Password confirmationテキストフィールドにpasswordと入力
                fill_in 'Password confirmation', with: 'password'
                # 登録と記述のあるsubmitをクリックする
                click_button '登録'
                # posts_pathへ遷移することを期待する
                expect(current_psth).to eq posts_path
              end
            end

            context 'ユーザー名、メール未入力' do
              it 'ユーザーの新規作成が失敗' do
                #ユーザーの新規登録画面へ遷移
                visit sign_up_path
                # Nameテキストフィールドをnil状態にする
                fill_in 'Name', with: nil
                # Emailテキストフィールドをnil状態にする
                fill_in 'Email', with: nil
                # Passwordテキストフィールドにpasswordと入力
                fill_in 'Password', with: 'password'
                # Password confirmationテキストフィールドにpasswordと入力
                fill_in 'password confirmation', with: 'password'
                # 登録と記述のあるsubmitをクリックする
                click_button '登録'
                # sign_up_pathへ遷移することを期待する
                expect(current_psth).to eq sign_up_path
              end

            end

            context '登録済みユーザー名、メール' do
              it 'ユーザーの新規作成が失敗' do
                #ユーザーの新規登録画面へ遷移
                visit sigin_up_path
                # Nameテキストフィールドにlet(:user)に定義したユーザーデータのnameを入力
                fill_in 'Name', with: user.name
                # Emailテキストフィールドにlet(:user)に定義したユーザーデータのemailを入力
                fill_in 'Email', with: user.email
                # Passwordテキストフィールドにpasswordと入力
                fill_in 'Password', with: 'password'
                # Password confirmationテキストフィールドにpasswordと入力
                fill_in 'Password confirmation', with: 'password'
                # 登録と記述のあるsubmitをクリックする
                click_button '登録'
                # sign_up_pathへ遷移することを期待する
                expect(current_psth).to eq sigin_up_path
                # 遷移されたページに'Email can't be blank'の文字列があることを期待する
                expect(page).to have_content "Email has already been taken"
              end
            end
          end
        end

        describe 'ログイン後' do
          before { login(user) }
          describe 'ユーザー編集' do
            context 'フォーム入力値が正常' do
              it 'ユーザー編集が成功' do
                visit edit_user_path(user)
                fill_in 'Name', with: 'ユーザーテスト'
                fill_in 'Email',with: 'text@example'
                fill_in 'Password', with: 'password'
                fill_in 'Password confirmation', with: 'password'
                click_button '更新'
                expect(current_path).to eq user_path(user)
              end
            end

            context 'ユーザ名、メールが未入力' do
              it 'ユーザーの編集が失敗' do
                visit edit_user_path(user)
                fill_in 'Name', with: nil
                fill_in 'Email', with: nil
                fill_in 'Password', with: 'password'
                fill_in 'Password confirmation', with: 'password'
                click_button '更新'
                expect(current_psth).to eq edit_user_path(user)
              end
            end
          end
        end

      end

    end