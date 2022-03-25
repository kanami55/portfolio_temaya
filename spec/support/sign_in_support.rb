  module SignInSupport
    def sign_in(user)
      visit root_path
      visit new_user_session_path
      fill_in 'user_name', with: user.name
      fill_in 'user_password', with: user.password
      click_button 'ログイン'
      expect(current_path).to eq posts_path
    end
  end