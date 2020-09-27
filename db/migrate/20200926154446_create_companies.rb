class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    remove_column :job_applications, :company, :string
    
    create_table :companies, id: :uuid do |t|
      t.string :name, null: false, index: true, unique: true
      
      t.timestamps
    end
  end
end
