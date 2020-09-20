class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications, id: :uuid do |t|
      t.references :user, index: true, null: false, type: :uuid
      t.string :company, null: false, index: true
      t.string :position, null: false, index: true
      t.integer :job_type, default: 0, index: true, null: false

      t.timestamps
    end
  end
end
