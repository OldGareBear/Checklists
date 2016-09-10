class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :text
      t.boolean :is_done
      t.references :checklist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
