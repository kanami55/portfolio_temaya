require 'rails_helper'

  RSpec.describe "Likeモデルのテスト", type: :model do
    before do
      @like = FactoryBot.build(:like)
    end

    describe '正常値と異常値の確認' do
    context 'likeモデルのバリデーション' do
      it "user_idとpost_idがあれば保存できる" do
        expect(FactoryBot.create(:like)).to be_valid
      end

      it "user_idがなければ無効な状態であること" do
        @like.user = nil
        @like.valid?
        expect(@like.errors[:user]).to include ("を入力してください")
      end

      it "post_idがなければ無効な状態であること" do
        @like.post = nil
        @like.valid?
        expect(@like.errors[:post]).to include("を入力してください")
      end
    end
    end
  end