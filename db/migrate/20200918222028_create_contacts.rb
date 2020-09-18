class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts, id: :uuid do |t|
      t.references :job_application, index: true, null: false, type: :uuid
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :title
      t.string :email, null: false

      t.timestamps
    end
  end
end
