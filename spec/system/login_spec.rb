require 'rails_helper'

describe 'ユーザーログイン前のテスト' do
  describe 'headerのテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認'do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'タイトルが表示される' do
　　　　expect(page).to home_context "Temaya"
      end
      it 'ホームが表示される：左上から１番目のリンクが「ホーム」である' do
        home_link = find_all('a')[1].native.inner_text
        expect(home_link).to match("ホーム")
      end
      it 'photoが表示される：左上から２番目のリンクが「photo」である' do
        photo_link = find_all('a')[2].native.inner_text
        expect(photo_link).to match("Photo")
      end
      it 'ログインリンクが表示される:左上から３番目のリンクが「ログイン」である' do
        log_in_link = find_all('a')[3].native.inner_text
        expect(log_in_link).to match("ログイン")
      end
      it '新規登録が表示される：左上から４番目のリンクが「新規登録」である' do
        sign_up_link = find_all('a')[4].native.inner_text
        expect(sign_up_link).to match("新規登録")
      end
    end

    context 'リンクの内容確認' do
      it 'ホームとクリックするとホーム画面に遷移する' do
        visit root_path
        click_link 'ホーム'
        expect(current_path).to eq root_path
      end
      it 'Photoをクリックすると投稿一覧画面に遷移する' do
        visit root_path
        click_link 'Photo'
        expect(current_path).to eq users_path
      end
      it 'ログインをクリックするとログイン画面に遷移する' do
        visit root_path
        click_link 'ログイン'
        expect(current_path).to eq user_session_path
      end
      it '新規登録をクリックすると新規登録画面に遷移する' do
        visit root_path
        click_link '新規登録'
        expect(current_path).to eq new_user_registration_path
      end
    end
  end
end