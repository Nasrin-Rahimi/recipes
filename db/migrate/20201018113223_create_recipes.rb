class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.text :description
      t.string :cooktime
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
