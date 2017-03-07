class CreateTables < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :category_types do |t|
      t.integer :category_id
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :units do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :items do |t|
      t.integer :category_type_id
      t.string :item_code
      t.string :item_name
      t.integer :unit
      t.decimal :price
      t.integer :stock
      t.timestamps
    end

  end
end
