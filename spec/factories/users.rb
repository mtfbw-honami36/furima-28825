FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"ab00000"}
    password_confirmation {password}
    kanji_last_name       {"阿部"}
    kanji_first_name      {"太郎"}
    kana_last_name        {"アベ"}
    kana_first_name       {"タロウ"}
    BirthDay              {"1995-08-10"}
  end
end
