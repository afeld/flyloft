class CreateOrgs < ActiveRecord::Migration
  def self.up
    create_table :orgs do |t|
      t.string :name
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.text :mission
      t.integer :contact_person_id
      t.integer :founding_year

      t.timestamps
    end
  end

  def self.down
    drop_table :orgs
  end
end
