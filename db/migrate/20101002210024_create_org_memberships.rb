class CreateOrgMemberships < ActiveRecord::Migration
  def self.up
    create_table :org_memberships do |t|
      t.integer :user_id
      t.integer :org_id
      t.boolean :is_admin

      t.timestamps
    end
  end

  def self.down
    drop_table :org_memberships
  end
end
