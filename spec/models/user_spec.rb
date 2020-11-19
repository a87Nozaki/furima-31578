require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user）
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,email,password_confimation,first_name,last_name,first_name_kana,last_name_kana,birthdayがあれば新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = null
        @user.valid?
        expect(@user.errors.full_messages).to include 'ニックネームを入力してください'
      end

      it 'emailに＠が存在しない場合は登録できない' do
        @user.email = 'nozakiyuki'
        @user.valid?
        expect(@user.errors.full_messages).to include 'メールアドレスは不正な値です'
      end

      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードを入力してください'
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confimation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confimation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは英字と数字の両方を含めて設定してください'
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confimation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは英字と数字の両方を含めて設定してください'
      end

      it 'password_confirmationが空では登録できない' do
        @user.password = 'abc123'
        @user.password_confimation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '確認用パスワードとパスワードが一致しません'
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '姓名を入力してください'
      end

      it 'first_nameが全角(漢字,ひらがな,カタナカ)でない場合登録できない' do
        @user.first_name = 'nozaki'
        @user.valid?
        expect(@user.errors.full_messages).to include '姓名は全角で入力してください'
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(p@user.errors.full_messages).to include '名前を入力してください'
      end
      
      it 'last_nameが全角(漢字,ひらがな,カタカナ)でない場合登録できない' do
        @user.last_name = 'yuki'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前は全角で入力してください'
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '姓名(カナ)を入力してください'
      end

      it 'first_name_kanaがカナでない場合登録できない' do
        @user.first_name_kana = 'nozaki'
        @user.valid?
        expect(@user.errors.full_messages).to include '姓名(カナ)は全角カナを入力してください'
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '名前(カナ)を入力してください'
      end

      it 'last_name_kanaがカナでない場合登録できない' do
        @user.last_name_kana = 'yuki'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前(カナ)は全角を入力してください'
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '生年月日を入力してください'
      end
    end
  end
end
