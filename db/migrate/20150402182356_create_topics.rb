class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.boolean :public, default: true
      t.boolean :bronze, default: false
      t.boolean :silver, default: false
      t.boolean :gold, default: false
      t.boolean :platinum, default: false
      t.text :description

      t.timestamps null: false
    end
  end
end
