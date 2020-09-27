class CreateCompanyJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :company_job_applications, id: :uuid do |t|
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.references :job_application, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
