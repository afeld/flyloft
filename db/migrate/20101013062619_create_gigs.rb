class CreateGigs < ActiveRecord::Migration
  def self.up
    create_table :gigs do |t|
      t.string :title
      t.string :company
      t.references :org
      t.text :description
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_email
      t.integer :creator_id
      t.string :city
      t.string :state
      t.string :country
      t.datetime :post_at
      t.datetime :expire_at
      t.boolean :enabled
      t.integer :view_count

      t.timestamps
    end
  end

  def self.down
    drop_table :gigs
  end
end
