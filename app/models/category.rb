class Category < ActiveRecord::Base
  has_many :category_types
end
