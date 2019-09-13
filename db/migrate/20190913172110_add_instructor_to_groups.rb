class AddInstructorToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :instructor, :string
  end
end
