class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
        t.string :title, null: false
        t.text :body, null: false
        t.string :author, null: false

        t.timestamps(null: false)
    end
  end
end
