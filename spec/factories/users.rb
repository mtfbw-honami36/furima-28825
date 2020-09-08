FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {password}
    kanji_last_name       {"阿部"}
    kanji_first_name      {"太郎"}
    kana_last_name        {"アベ"}
    kana_first_name       {"タロウ"}
  end
end