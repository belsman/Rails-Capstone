class CreateBuzzs < ActiveRecord::Migration[6.0]
  def change
    create_table :buzzs do |t|
      t.text :text
      t.integer :author_id

      t.timestamps
    end

    add_index :buzzs, :author_id
  end
end
