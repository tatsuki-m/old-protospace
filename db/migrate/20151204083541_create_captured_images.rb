class CreateCapturedImages < ActiveRecord::Migration
  def change
    create_table :captured_images do |t|
      t.string :content
      t.integer :status
      t.references :prototype, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
