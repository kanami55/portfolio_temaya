 require 'rails_helper' #設定などを行うファイル

  RSpec.describe Post, "Postモデルに関するテスト", type::model do
    describe '実際に保存してみる' do
      it "正しい投稿内容の場合は保存されるか" do
        expect(FactoryBot.build(:post)).to be_valid #有効か
      end
    end

    context "空白バリデーションチェック" do
      it "titleが空白の場合にバリでージョンチェックされ、空白メッセージが返ってきているか" do
        post = Post.new(title: 'hoge', production_period: '', cost: 'hoge', difficulty: 'hoge', explanation: 'hoge')
        expect(post).to be_invalid #無効か
        expect(post.errors[:production_period]).to include("can't be blank") #エラーメッセージが配列に含まれるか
      end

      it "production_periodが空白の場合にバリデーションチェックされ、空白のメッセージが返ってきているか" do
        post = Post.new(title: 'hoge', production_period: '', cost: 'hoge', difficulty: 'hoge', explanation: 'hoge')
        expect(post).to be_invalid #無効か
        expect(post.errors[:production_period]).to include("can't be blank") #エラーメッセージが配列に含まれるか
      end

      it "costが空白の場合にバリデーションチェックされ、空白のエラーメッセージが返ってきているか" do
        post = Post.new(title: 'hoge', production_period: 'hoge', cost: '', difficulty: 'hoge', explanation: 'hoge')
        expect(post).to be_invalid #無効か
        expect(post.errors[:cost]).to include("can't be blank") #エラーメッセージが配列に含まれるか
      end

      it "difficultyが空白の場合にバリデーションチェックされ、空白のメッセージが返ってきているか" do
        post = Post.new(title: 'hoge', production_period: 'hoge', cost: 'hoge', difficulty: '', explanation: 'hoge')
        expect(post).to be_invalid #無効か
        expect(post.errors[:difficulty]).to include("can't be blank") #エラーメッセージが配列に含まれるか
      end

      it "explanationが空白の場合にバリデーションチェックされ、空白のメッセージが返ってきているか" do
        post = Post.new(title: 'hoge', production_period: 'hoge', cost: 'hoge', difficulty: 'hoge', explanation: '')
        expect(post).to be_invalid #無効か
        expect(post.errors[:explanation]).to include("can't be blank") #エラーメッセージが配列に含まれるか
      end
    end
  end