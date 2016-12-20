class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :category
      t.string :text
      t.string :theme
      t.string :zip_code

      t.timestamps
    end
  end
end
