class AddTypeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :type, :string, default: 'Patient'
  end
end
