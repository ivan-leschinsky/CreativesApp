class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :number
      t.text :body
      t.integer :creative_id

      t.timestamps
    end
  end
end
