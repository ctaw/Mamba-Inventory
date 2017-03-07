class Item < ActiveRecord::Base

  before_create :generate_item_code

  belongs_to :category_type
  belongs_to :unit

  private

  def generate_item_code
    begin
      self.item_code = SecureRandom.random_number(999999).to_i
    end while self.class.exists?(item_code: item_code)
  end

end
