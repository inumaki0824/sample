class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      # ==========ここから追加する==========
      t.string :title, null: false
      t.references :user, foreign_key: true, null: false
      # ==========ここまで追加する==========
      t.timestamps
    end
  end
end
