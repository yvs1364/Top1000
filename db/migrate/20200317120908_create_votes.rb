class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :note
      t.references :user, foreign_key: true
      t.references :pin, foreign_key: true

      t.timestamps
    end
  end
end
