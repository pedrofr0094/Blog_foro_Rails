class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.string :article.title
      t.string :user.username
      t.text :description
      t.integer :votes
      t.timestamps
    end
  end
end
