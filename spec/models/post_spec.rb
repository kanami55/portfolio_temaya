require 'rails_helper' # 設定などを行うファイル

RSpec.describe "Postモデルのテスト", type: :model do
  before do
    @post = FactoryBot.build(:post)
    @post = build(:post)
    @post.photo = fixture_file_upload("spec/fixtures/files/dummy.png")
  end
  describe 'バリデーションのテスト' do
    context '投稿画像' do
      it 'photoが存在すれば登録可' do
        expect(@post).to be_valid # 有効であるか
      end
    end

    context 'titleカラム' do
      it '空欄で無いこと' do
        @post.title = ''
        expect(@post).to be_invalid # 無効であるか
        expect(@post.errors[:title]).to include "を入力してください" # 配列に指定の値が含まれているか
      end
    end

    context 'production_periodカラム' do
      it '空欄で無いこと' do
        @post.production_period = ''
        expect(@post).to be_invalid
        expect(@post.errors[:production_period]).to include "を入力してください"
      end
    end

    context 'costカラム' do
      it '空欄で無いこと' do
        @post.cost = ''
        expect(@post).to be_invalid
        expect(@post.errors[:cost]).to include "を入力してください"
      end
    end

    context 'explanationカラム' do
      it '空欄で無いこと' do
        @post.explanation = ''
        expect(@post).to be_invalid
        expect(@post.errors[:explanation]).to include "を入力してください"
      end
    end

    context 'difficultyカラム' do
      it '空欄で無いこと' do
        @post.difficulty = ''
        expect(@post).to be_invalid
        expect(@post.errors[:difficulty]).to include "を入力してください"
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1になっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
