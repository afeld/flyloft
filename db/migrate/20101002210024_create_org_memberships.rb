class CreateOrgMemberships < ActiveRecord::Migration
  def self.up
    create_table :org_memberships do |t|
      t.references :user
      t.references :org
      t.boolean :is_admin

      t.timestamps
    end
  end

  def self.down
    drop_table :org_memberships
  end
end
