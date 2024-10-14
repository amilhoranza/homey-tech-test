class CreateHistoryItems < ActiveRecord::Migration[7.1]
  def change
    create_table :history_items do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :item, polymorphic: true, null: false
      t.string :description

      t.timestamps
    end
  end
end
