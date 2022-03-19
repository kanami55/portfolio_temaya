require 'rails_helper'

RSpec.describe PostComment, type: :model do
  before do
    user = FactoryBot.create(:user)
    @post_comment = FactoryBot.build(:post_comment, user_id: user.id)
  end

  describe 'コメント機能' do
    context 'コメントを保存できる場合' do
      it "コメント文を入力済みであれば保存できる" do
        expect(@post_comment).to be_valid # 有効であるか
      end
    end

    context 'コメントを保存できない場合' do
      it "コメントが空では投稿できない" do
        @post_comment.comment = ''
        @post_comment.valid?
        expect(@post_comment.errors.full_messages).to include "Commentを入力してください"
      end

      it "ユーザーがログインしていなければコメントできない" do
        @post_comment.user = nil
        @post_comment.valid?
        expect(@post_comment.errors.full_messages).to include "Userを入力してください"
      end

      it "投稿したものがなければコメントできない" do
        @post_comment.post = nil
        @post_comment.valid?
        expect(@post_comment.errors.full_messages).to include "Postを入力してください"
      end
    end
  end

  describe 'アソシエーションテスト' do
    context 'Userモデルとの関係' do
      it "N:1になっていること" do
        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
