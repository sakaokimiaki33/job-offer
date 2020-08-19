class AddImageToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :image, :string
    add_reference :images, :job, foreign_key: true
  end
end
