class Sale < ActiveRecord::Base
  before_create :generate_transaction_code

  def get_item_name
    item = Item.where(id: self.item_id).first
    return item.item_name
  end

  private

  def generate_transaction_code
    begin
      self.transaction_code = SecureRandom.random_number(999999).to_i
    end while self.class.exists?(transaction_code: transaction_code)
  end
end
