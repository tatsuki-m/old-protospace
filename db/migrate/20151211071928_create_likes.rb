class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :prototype, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
