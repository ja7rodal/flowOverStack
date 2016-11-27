class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.integer :voteable_id
      t.string :voteable_type

      t.timestamps
    end
  end
end
