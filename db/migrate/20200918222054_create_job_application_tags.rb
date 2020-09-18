class CreateJobApplicationTags < ActiveRecord::Migration[6.0]
  def change
    create_table :job_application_tags, id: :uuid do |t|
      t.references :job_application, null: false, index: true, type: :uuid
      t.references :tag, null: false, index: true, type: :uuid

      t.timestamps
    end
  end
end
