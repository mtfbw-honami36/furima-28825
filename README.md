# README

# テーブル設計

## usersテーブル
| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| kanji_last_name   | string | null: false |
| kanji_first_name  | string | null: false |
| kana_last_name    | string | null: false |
| kana_first_name   | string | null: false |
| BirthDay          | date   | null: false |

### Association
has_many :items
has_many :comments
has_one :purchase
has_one :address


## itemsテーブル
| Column            | Type    | Options                        |
| ----------------- | ------- | ------------------------------ |
| images            | string  | null: false                    |
| items_name        | string  | null: false                    |
| text              | string  | null: false                    |
| genre_id          | integer | null: false                    |
| item_condition_id | integer | null: false                    |
| shipping_cost_id  | integer | null: false                    |
| ship_from_id      | integer | null: false                    |
| delivery_days_id  | integer | null: false                    |
| price             | integer | null: false                    |
| user_id           | integer | null: false, foreign_key: true |

### Association
belongs_to :user
has_many :comments
has_one :purchase


## Addressesテーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| PostalCode    | string  | null: false                    |
| state         | string  | null: false                    |
| city          | string  | null: false                    |
| block_number  | string  | null: false                    |
| building_name | string  | null: false                    |
| PhoneNumber   | integer | null: false                    |
| user_id       | integer | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase


## Purchasesテーブル
| item_id       | integer | null: false, foreign_key: true |
| user_id       | integer | null: false, foreign_key: true |
| address_id    | integer | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
belongs_to :address


## commentsテーブル
| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| texts    | string  | null: false                    |
| item_id  | integer | null: false, foreign_key: true |
| user_id  | integer | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item