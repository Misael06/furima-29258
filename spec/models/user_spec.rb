require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,lastnameとfirstname,lastname_jpとfirstname_jp,birthdayが存在すれば登録できる" do
        user = FactoryBot.build(:user)
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
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "重複したnicknameが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Nickname has already been taken")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれてないと登録できない" do
        @user.email = 'kkkgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = 'saaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordがローマ字のみだと登録できない" do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
      end
      it "passwordが数字のみだと登録できない" do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "lastnameが空では登録できない" do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it "lastnameが全角で入力されていないと登録できない" do
        @user.lastname = 'matuzaki' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname Full-width characters")
      end
      it "firstnameが空では登録できない" do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "firstnameが全角で入力されていないと登録できない" do
        @user.firstname = 'satoshi' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname Full-width characters")
      end
      it "lastname_jpが空では登録できない" do
        @user.lastname_jp = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname jp can't be blank")
      end
      it "lastnameがカタカナでないと登録できない" do
        @user.lastname_jp = '松崎' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname jp Full-width katakana characters")
      end
      it "firstname_jpが空では登録できない" do
        @user.firstname_jp = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname jp can't be blank")
      end
      it "firstnameがカタカナでないと登録できない" do
        @user.firstname_jp = '聡' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname jp Full-width katakana characters")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
