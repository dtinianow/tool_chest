class AddCategoryReferenceToTools < ActiveRecord::Migration[5.0]
  def change
    add_reference :tools, :category, foreign_key: true
  end
end
