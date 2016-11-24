class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.string :voteable_type
      t.integer :voteable_id

      t.timestamps
    end
  end
end
