require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、kanji_last_name、kanji_first_name、kana_last_name、kana_first_name、BirthDayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上、半角英数字、password_confirmationと一致する時に登録できる" do
        @user.password = "abe123"
        @user.password_confirmation = "abe123"
        expect(@user).to be_valid
      end

      it "emailに＠が含まれていれば登録できる" do
        @user.email = "abe123@taro.jp"
        expect(@user).to be_valid
      end
    end


    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
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

      it "emailに＠がない場合登録できない" do
        @user.email = "abemail.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "abe00"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it "passwordが半角英数でない場合登録できない" do
        @user.password = "ABE123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = "abe123"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "苗字が空では登録できない" do
        @user.kanji_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
      end

      it "名前が空では登録できない" do
        @user.kanji_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
      end

      it "苗字が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.kanji_last_name = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last name is invalid")
      end

      it "名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.kanji_first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name is invalid")
      end

      it "苗字のフリガナが空では登録できない" do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end

      it "名前のフリガナが空では登録できない" do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      it "苗字のフリガナが全角（カタカナ）でなければ登録できない" do
        @user.kana_last_name = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid")
      end

      it "名前のフリガナが全角（カタカナ）でなければ登録できない" do
        @user.kana_first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid")
      end
      
      it "生年月日が空では登録できない" do
        @user.BirthDay = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
