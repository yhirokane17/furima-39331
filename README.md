# DB 設計

## users_table

| Column                 | Type     | Options                   |
|------------------------|----------|---------------------------|
| nickname               | string   | null: false               |
| email                  | string   | null: false,unique: true  |
| encrypted_password     | string   | null: false               |
| last_name              | string   | null: false               |
| first_name             | string   | null: false               |
| last_name_kana         | string   | null: false               |
| first_name_kana        | string   | null: false               |
| birthday               | date     | null: false               |

### Association

* has_many :items
* has_many :documents

## items_table

| Column                | Type       | Options                        |
|--------------------   |------------|--------------------------------|
| user                  | references | null: false, foreign_key: true |
| item                  | text       | null: false                    |
| explanation           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| delivery_price_id     | integer    | null: false                    |
| address_prefecture_id | integer    | null: false                    |
| delivery_date_id      | integer    | null: false                    |
| price                 | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :documents

##  documents_table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

##  shipping_addresses_table

| Column                | Type       | Options                        |
|---------------------- |------------|--------------------------------|
| order                 | references | null: false, foreign_key: true |
| number                | string     | null: false                    |
| address_prefecture_id | integer    | null: false                    |
| address_city          | string     | null: false                    |
| address_number        | string     | null: false                    |
| address_building      | string     |                                |
| telephone             | string     | null: false                    |

- belongs_to :documents