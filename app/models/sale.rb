class Sale < ActiveRecord::Base
  before_create :generate_transaction_code

  def get_item_name
    item = Item.where(id: self.item_id).first
    return item.item_name
  end

  def get_item_code
    item_code = Item.where(id: self.item_id).first
    return item_code.item_code
  end

  def get_item_unit
    item_unit = Item.where(id: self.item_id).first
    unit = Unit.where(id: item_unit.unit_id).first
    unit_name = unit.name
    return unit_name
  end

  private

  def generate_transaction_code
    begin
      self.transaction_code = SecureRandom.random_number(999999).to_i
    end while self.class.exists?(transaction_code: transaction_code)
  end
end
