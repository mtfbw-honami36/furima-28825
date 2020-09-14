FactoryBot.define do
  factory :item do
    name              { 'テント' }
    text              { 'キャンプにぴったりです' }
    genre_id          { 9 }
    item_condition_id { 3 }
    shipping_cost_id  { 2 }
    ship_from_id      { 23 }
    delivery_day_id   { 2 }
    price             { 6000 }
    association :user
  end
end
