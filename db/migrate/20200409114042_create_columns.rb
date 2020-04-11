class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :title
      t.text :body
      t.integer :fermer_id
      t.string :image
      t.timestamps
    end
  end
end
