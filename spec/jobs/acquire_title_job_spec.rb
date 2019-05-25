require 'rails_helper'

RSpec.describe AcquireTitleJob, type: :job do
	include ActiveJob::TestHelper
  
  describe "#perform_later" do
  	shortened = FactoryBot.create(:short_url, shortened_url: "1")

    it "queues the job" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        AcquireTitleJob.perform_later(shortened)
      }.to have_enqueued_job.on_queue("default").at(:no_wait)
    end

    xit "executes perform" do
	    perform_enqueued_jobs { AcquireTitleJob.perform_later(shortened) }
	    expect(ShortUrl.last.title).to eq("Google")
		end
  end

end
