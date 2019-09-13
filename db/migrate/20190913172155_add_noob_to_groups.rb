class AddNoobToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :noob, :string
  end
end
