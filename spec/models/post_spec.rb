 require 'rails_helper' #設定などを行うファイル

  RSpec.describe "Postモデルのテスト", type: :model do
    describe 'バリデーションのテスト' do

      let(:user) { FactoryBot.create(:user) }
      let!(:post) {build(:post, user_id: user.id)}

      context 'titleカラム' do
        it '空欄で無いこと' do
          post.title = ''
          expect(post).to be_invalid
          expect(post.errors[:title]).to include("を入力してください")
        end
      end

      context 'production_periodカラム' do
        it '空欄で無いこと' do
          post.production_period = ''
          expect(post).to be_invalid
          expect(post.errors[:production_period]).to include("を入力してください")
        end
      end

      context 'costカラム' do
        it '空欄で無いこと' do
          post.cost = ''
          expect(post).to be_invalid
          expect(post.errors[:cost]).to include("を入力してください")
        end
      end

      context 'explanationカラム' do
        it '空欄で無いこと' do
          post.explanation = ''
          expect(post).to be_invalid
          expect(post.errors[:explanation]).to include("を入力してください")
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