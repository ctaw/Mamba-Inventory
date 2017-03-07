class DropItemsAndCreateItems < ActiveRecord::Migration
  def change
    drop_table :items

    create_table :items do |t|
      t.integer :category_type_id
      t.string :item_code
      t.string :item_name
      t.text :description
      t.integer :unit
      t.decimal :price
      t.integer :stock
      t.timestamps
    end

    create_table :companies do |t|
      t.string :name
      t.text :description
      t.integer :branch_id
      t.timestamps
    end

    create_table :branches do |t|
      t.string :contact_number
      t.text :location
      t.integer :employee_id
      t.timestamps
    end

    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :position_id
      t.integer :branch_id
      t.timestamps
    end

    create_table :positions do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

  end
end
