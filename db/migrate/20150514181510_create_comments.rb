class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      t.column :txt, :text
      t.column :rating, :integer
      t.timestamps null: false
    end
  end
end
