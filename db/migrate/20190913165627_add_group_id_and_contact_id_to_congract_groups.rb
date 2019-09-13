class AddGroupIdAndContactIdToCongractGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :contact_groups, :group_id, :integer
    add_column :contact_groups, :contact_id, :integer
  end
end
