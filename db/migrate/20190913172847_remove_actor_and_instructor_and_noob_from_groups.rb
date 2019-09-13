class RemoveActorAndInstructorAndNoobFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :actor, :string
    remove_column :groups, :instructor, :string
    remove_column :groups, :noob, :string
  end
end
