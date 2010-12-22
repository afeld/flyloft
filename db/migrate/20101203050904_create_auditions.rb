class CreateAuditions < ActiveRecord::Migration
  def self.up
    create_table :auditions do |t|
      t.references :gig
      t.string :place
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end

  def self.down
    drop_table :auditions
  end
end
