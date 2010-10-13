class CreateOrgMembers < ActiveRecord::Migration
  def self.up
    create_table :org_members do |t|
      t.integer :user_id
      t.integer :org_id
      t.boolean :is_admin, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :org_members
  end
end
