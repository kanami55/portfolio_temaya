require 'rails_helper'

describe 'ユーザーログイン前にテスト' do
  describe 'top画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認'do
      it 'URLのが正しい' do
        expect(current_path).to eq '/'
      end
      it ''
    end
  end
end