class AddEnumToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :primary, :boolean, index: true, default: false
  end
end
