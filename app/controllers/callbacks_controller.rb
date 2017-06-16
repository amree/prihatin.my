class CallbacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    id = params.dig("id")

    UpdatePaymentStatusJob.perform_later id

    head :ok, content_type: "text/html"
  end
end
