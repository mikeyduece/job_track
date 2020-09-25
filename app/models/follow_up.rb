# == Schema Information
#
# Table name: follow_ups
#
#  id                 :uuid             not null, primary key
#  interval           :string           not null
#  number             :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  job_application_id :uuid             not null
#
# Indexes
#
#  index_follow_ups_on_interval             (interval)
#  index_follow_ups_on_job_application_id   (job_application_id)
#  index_follow_ups_on_number               (number)
#  index_follow_ups_on_number_and_interval  (number,interval)
#
class FollowUp < ApplicationRecord
end
