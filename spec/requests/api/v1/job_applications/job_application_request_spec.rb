require 'rails_helper'

describe Api::V1::JobApplications::JobApplicationsController, type: :request do
  include_context 'shared headers'
  
  let(:user) { create(:user) }
  let(:params) {
    { data: {
      type: 'application',
      attributes: {
        position: 'Super Cool Position',
        job_type: :backend,
      },
      relationships: {
        contacts: {
          data: {
            type: 'contacts',
            attributes: {
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.unique.email,
              title: 'CTO',
              primary: true,
            }
          }
        },
        company: {
          data: {
            type: 'company',
            attributes: {
              name: Faker::Company.name,
            }
          }
        }
      }
    } }
  }
  
  context 'POST #create' do
    let(:job_app) { user.applications.last }
    let(:primary_contact) { job_app.primary_contact }
    
    before do
      login_as_user(user)
      post "/api/v1/job_applications", params: params, headers: headers
    end
    
    it 'should return 201' do
      expect(response).to have_http_status(:created)
    end

    it 'should have correct attributes' do
      expect(job_app.backend?).to be(true)
      expect(job_app.company).to eq(params.dig(:data, :attributes, :company))
    end

    it 'should have correct contact information' do
      expect(primary_contact).not_to be_nil
      expect(job_app.contacts).not_to be_empty
      expect(primary_contact.email).to eq(params.dig(:data, :relationships, :contacts, :data, :attributes, :email))
    end

    it 'should have a company' do
      expect(job_app.company_name).to eq(params.dig(:data, :relationships, :company, :name))
    end
  end
end