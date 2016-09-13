class AddAuthorToChecklist < ActiveRecord::Migration
  def change
    add_column :checklists, :author_id, :integer
    add_foreign_key :checklists, :users, column: :author_id
  end
end
