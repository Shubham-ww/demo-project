class AddWelcomeidToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :welcome_id, :integer
  end
end
