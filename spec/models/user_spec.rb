require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    context "新規登録できる場合" do
      it "必要事項が全て記入されていれば登録できること" do
        expect(@user).to be_valid
      end

      it "nicknameが1文字以上で登録できる" do
        @user.nickname = "a"
        expect(@user).to be_valid
      end

      it "passwordが半角英数6文字以上で登録できる" do
        @user.password = "tech55"
        @user.password_confirmation = "tech55"
        expect(@user).to be_valid
      end

      it "last_nameが全角混同でも登録できる" do
        @user.last_name = "山しタ"
        expect(@user).to be_valid
      end

      it "first_nameが全角混同でも登録できる" do
        @user.last_name = "太ろウ"
        expect(@user).to be_valid
      end
    end


    context "新規登録ができない場合" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
#============================================================================================
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが@無しでは登録できない" do
        @user.email = "testcom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
#============================================================================================
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが数字かつ5文字以下であれば登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password Include both letters and numbers")
      end
      it "passwordが6文字以上でも数字のみであれば登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが半角英数でも5文字以下であれば登録できない" do
        @user.password = "tech5"
        @user.password_confirmation = "tech5"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
#============================================================================================
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters.")
      end
      it "last_nameが英語では登録できない" do
        @user.last_name = "ＹＡＭＡＤＡ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters.")
      end
      it "last_nameが数字では登録できない" do
        @user.last_name = "８７１０"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters.")
      end
#============================================================================================
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters.")
      end
      it "first_nameが英語では登録できない" do
        @user.first_name = "ＴＡＲＯ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters.")
      end
      it "first_nameが数字では登録できない" do
        @user.first_name = "８７１０"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters.")
      end
#============================================================================================
      it "last_name_readingが空では登録できない" do
        @user.last_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it "last_name_readingが半角では登録できない" do
        @user.last_name_reading = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading Full-width katakana characters.")
      end
      it "last_name_readingが英語では登録できない" do
        @user.last_name_reading = "ＹＡＭＡＤＡ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading Full-width katakana characters.")
      end
      it "last_name_readingがひらがなでは登録できない" do
        @user.last_name_reading = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading Full-width katakana characters.")
      end
      it "last_name_readingが漢字では登録できない" do
        @user.last_name_reading = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading Full-width katakana characters.")
      end
      it "last_name_readingが数字では登録できない" do
        @user.last_name_reading = "８７１０"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading Full-width katakana characters.")
      end
#============================================================================================
      it "first_name_readingが空では登録できない" do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it "first_name_readingが半角では登録できない" do
        @user.first_name_reading = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading Full-width katakana characters.")
      end
      it "first_name_readingが英語では登録できない" do
        @user.first_name_reading = "ＹＡＭＡＤＡ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading Full-width katakana characters.")
      end
      it "first_name_readingがひらがなでは登録できない" do
        @user.first_name_reading = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading Full-width katakana characters.")
      end
      it "first_name_readingが漢字では登録できない" do
        @user.first_name_reading = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading Full-width katakana characters.")
      end
      it "first_name_readingが数字では登録できない" do
        @user.first_name_reading = "８７１０"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading Full-width katakana characters.")
      end
#============================================================================================
      it "birthdayが--では登録できない" do
        @user.birthday = "--"
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
