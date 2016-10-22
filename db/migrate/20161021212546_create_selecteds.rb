class CreateSelecteds < ActiveRecord::Migration
  def change
    create_table :selecteds do |t|
      t.integer :pick_1, :references => "hero", index: true
      t.integer :pick_2, :references => "hero", index: true
      t.integer :pick_3, :references => "hero", index: true
      t.integer :pick_4, :references => "hero", index: true
      t.integer :pick_5, :references => "hero", index: true
      t.references :match, index: true
      t.string :bando, limit: 7

      t.timestamps null: false
    end
    add_foreign_key :selecteds, :heros
    add_foreign_key :selecteds, :matches
  end
end
