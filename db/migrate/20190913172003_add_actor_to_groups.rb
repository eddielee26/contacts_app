class AddActorToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :actor, :string
  end
end
