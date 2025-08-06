class CreateClientTags < ActiveRecord::Migration[8.0]
  def change
    create_table :client_tags do |t|
      t.references :client, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
