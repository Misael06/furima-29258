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
      it "nicknameが入力されてたらで登録できる" do
        @user.nickname = "jona"
        expect(@user).to be_valid
      end
      it "passwordが英数字を含む6文字以上であれば登録できる" do
        @user.password = "aaaa00"
        @user.password_confirmation = "aaaa00"
        expect(@user).to be_valid
      end
      it "lastnameが日本語で入力されていれば登録できる" do
        @user.lastname = "松崎"
        expect(@user).to be_valid
      end
      it "firstnameが日本語で入力されていれば登録できる" do
        @user.firstname = "聡"
        expect(@user).to be_valid
      end
      it "lastname_jpがカタカナで入力されていれば登録できる" do
        @user.lastname_jp = "マツザキ"
        expect(@user).to be_valid
      end
      it "firstname_jpがカタカナで入力されていれば登録できる" do
        @user.firstname_jp = "サトシ"
        expect(@user).to be_valid
      end
      it "birthdayが入力されていれば登録できる" do
        @user.birthday = "2000/01/01"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "重複したnicknameが存在する場合登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "emailに@が含まれてないと登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordがローマ字のみだと登録できない" do
      end
      it "passwordが数字のみだと登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
    end
  end
end
