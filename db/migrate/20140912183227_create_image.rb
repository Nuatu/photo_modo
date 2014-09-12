class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.integer :qty_likes, default: :'0'
      t.attachment :photo
      t.belongs_to :user
    end
  end
end
