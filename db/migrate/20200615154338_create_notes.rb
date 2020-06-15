class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :body
      t.datetime :note_time
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
