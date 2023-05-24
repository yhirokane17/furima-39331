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
| date                   | string   | null: false               |

### Association

* has_many :items
* has_many :records

## items_table

| Column             | Type       | Options                        |
|-----------------   |------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_price_id  | integer    | null: false                    |
| shipper_address_id | integer    | null: false                    |
| delivery_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |

### Association

- has_many :users
- has_one :record

##  records_table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :shipping address

##  shipping_addresses_table

| Column             | Type       | Options                        |
|-------------       |------------|--------------------------------|
| number             | string     | null: false                    |
| address_prefecture | integer    | null: false                    |
| address            | string     | null: false                    |
| telephone          | string     | null: false                    |



- belongs_to :user
- belongs_to :record