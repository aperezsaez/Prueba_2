class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.boolean :done, default: false
      t.references :user, foreign_key: true
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
