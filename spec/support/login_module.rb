module LoginModule
  def login(user)
    visit login_path
    fill_in 'name', with: user.name
    fill_in 'password', with: 'password'
    click_button 'Login'
  end
end
