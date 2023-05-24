# DB 設計

## users table

| Column                 | Type     | Options                   |
|------------------------|----------|---------------------------|
| nickname               | string   | null: false               |
| e-mail                 | string   | null: false               |
| password               | string   | null: false               |
| passwrod_confirmation  | string   | null: false               |
| last_name              | string   | null: false               |
| first_name             | string   | null: false               |
| last_name_kana         | string   | null: false               |
| first_name_kana        | string   | null: false               |
| date_of_birth_year     | string   | null: false               |
| date_of_birth_month    | string   | null: false               |
| date_of_birth_day      | string   | null: false               |

### Association

* has_many :items
* has_many :records
* belongs_to :shipping_address

## items table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| user            | references | null: false, foreign_key: true |
| explanation     | text       | null: false                    |
| image           | text       | null: false                    |
| category        | references | null: false                    |
| status          | references | null: false                    |
| delivery_price  | text       | null: false                    |
| shipper_address | text       | null: false                    |
| delivery_date   | references | null: false                    |

### Association

- belongs_to :user
- belongs_to :record

##  record table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :shipping address

#  shipping address table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| number      | text       | null: false                    |
| address     | references | null: false                    |
| telephone   | references | null: false                    |
| user        | text       | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :record