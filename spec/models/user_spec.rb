require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confimation,first_name,last_name,first_name_kana,last_name_kana,birthdayがあれば新規登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空の場合は登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it '存在するemailでは登録できない' do
        @user.save
        anther_user = FactoryBot.build(:user)
        anther_user.email = @user.email
        anther_user.valid?
        expect(anther_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めて設定してください')
      end
      it 'password_confirmationが空では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードとパスワードが一致しません')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('姓名を入力してください')
      end
      it 'first_nameが全角(漢字,ひらがな,カタカナ)でない場合登録できない' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓名は全角で入力してください')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it 'last_nameが全角(漢字,ひらがな,カタカナ)でない場合登録できない' do
        @user.last_name = 'rikutaro'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角で入力してください')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('姓名(カナ)を入力してください')
      end
      it 'first_name_kanaがカナでない場合登録できない' do
        @user.first_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓名(カナ)は全角カナを入力してください')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)を入力してください')
      end
      it 'last_name_kanaがカナでない場合登録できない' do
        @user.last_name_kana = 'rikutaro'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)は全角を入力してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
