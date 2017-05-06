class AddEmailIdToCleaners < ActiveRecord::Migration
  def change
    add_column :cleaners, :email_id, :string
  end
end
