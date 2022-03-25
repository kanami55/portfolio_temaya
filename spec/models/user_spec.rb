require 'rails_helper' # rails_helperのファイルを読み込んでいる

RSpec.describe "Userモデルのテスト", type: :model do
  # 各テストコードが実行される前にFactoryBotで生成したインスタンス＠userを代入
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録ができるとき' do
      it '全ての項目が入力されていれば登録出来る' do
        expect(@user).to be_valid  # 有効であるか
      end
    end
  end

  context '新規登録出来ないとき' do
    it 'nameが空欄で無いこと' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nameを入力してください")
    end
    it 'emailが空欄で無いこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'emailに@が含まれている事いる事' do
      @user.email.slice!('@')
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it 'passwordが５以下で無いこと' do
      @user.password = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it 'passwordが空欄で無いこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'password_confirmationが空欄で無いこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
end
