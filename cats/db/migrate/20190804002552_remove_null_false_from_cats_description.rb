class RemoveNullFalseFromCatsDescription < ActiveRecord::Migration[5.2]
  def change
    remove_column :cats, :description
    add_column :cats, :description, :text
  end
end
