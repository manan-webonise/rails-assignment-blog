class AddIspublishedToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :ispublished, :boolean, :default => false
  end
end
