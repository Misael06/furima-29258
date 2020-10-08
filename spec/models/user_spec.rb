require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,lastnameとfirstname,lastname_jpとfirstname_jp,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailに@が含まれてないと登録できない" do
        @user.email = 'kkkgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = 'saaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordがローマ字のみだと登録できない" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードにはローマ字と数字が必須です。")
      end
      it "passwordが数字のみだと登録できない" do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードにはローマ字と数字が必須です。")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "lastnameが空では登録できない" do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(名)を入力してください")
      end
      it "lastnameが全角で入力されていないと登録できない" do
        @user.lastname = 'matuzaki' 
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(名)は全角で入力してください。")
      end
      it "firstnameが空では登録できない" do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(姓)を入力してください")
      end
      it "firstnameが全角で入力されていないと登録できない" do
        @user.firstname = 'satoshi' 
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(姓)は全角で入力してください。")
      end
      it "lastname_jpが空では登録できない" do
        @user.lastname_jp = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it "lastnameがカタカナでないと登録できない" do
        @user.lastname_jp = '松崎' 
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)は全角カタカナで入力してください。")
      end
      it "firstname_jpが空では登録できない" do
        @user.firstname_jp = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
      end
      it "firstnameがカタカナでないと登録できない" do
        @user.firstname_jp = '聡' 
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)は全角カタカナで入力してください。")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
