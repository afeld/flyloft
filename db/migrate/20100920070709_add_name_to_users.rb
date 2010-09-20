class AddNameToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
    end
  end

  def self.down
    drop_table :users
  end
end
