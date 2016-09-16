class CreateUsersChecklists < ActiveRecord::Migration
  def change
    create_table :checklists_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :checklist, index: true, foreign_key: true
    end
  end
end
