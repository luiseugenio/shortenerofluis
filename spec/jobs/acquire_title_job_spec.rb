require 'rails_helper'

RSpec.describe AcquireTitleJob, type: :job do
  
  describe "#perform_later" do
  	shortened = FactoryBot.create(:short_url)

    it "acquire title from URL" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        AcquireTitleJob.perform_later(shortened)
      }.to have_enqueued_job.on_queue("default").at(:no_wait)
    end
  end

end
