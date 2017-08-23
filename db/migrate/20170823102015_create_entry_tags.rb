class CreateEntryTags < ActiveRecord::Migration[5.0]
  def change
    create_table :entry_tags do |t|
      t.references :entry
      t.references :tag

      t.timestamps
    end
  end
end
