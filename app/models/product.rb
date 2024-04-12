class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :order
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :image, presence: true
  validates :product_name, presence: true, length: { maximum: 40 }
  validates :description_item, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 0, message: "can't be blank"  }
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank"  }
  validates :shipping_charge_id, numericality: { other_than: 0, message: "can't be blank"  }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"  }
  validates :shipping_date_id, numericality: { other_than: 0, message: "can't be blank"  }
  validates :price, presence: true,
  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end