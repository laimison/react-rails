module Api::V1
  class ExamplesController < ApplicationController
    # GET http://IP:PORT/v1/examples
    def index
      output = { example_get: params }
      logger.info("I have received GET: #{output}")
      render json: output
      # render json: Example.all
    end

    # GET http://IP:PORT/v1/examples/[:id]
    def show
      output = { example_get_for_id: params }
      logger.info("I have received GET with id: #{output}")
      render json: output
      # render json: Example.find(params[:id])
    end

    # POST http://IP:PORT/v1/examples
    def create
      output = { example_post: params }
      logger.info("I have received POST: #{output}")

      message = "#{params['message']}\n\nSent by #{params['email']}"
      email_from = "Mailer <example@example.com>"
      email_to = params['email'].to_s

      ActionMailer::Base.mail( from: email_from, to: email_to, subject: "Backend Email", body: message ).deliver_now

      render json: output
    end

    # PATCH http://IP:PORT/v1/examples/[:id]
    def update
      output = { example_patch_for_id: params }
      logger.info("I have received PATCH: #{output}")
      render json: output
    end

    # DELETE http://IP:PORT/v1/examples/[:id]
    def destroy
      output = { example_delete_for_id: params }
      logger.info("I have received DELETE: #{output}")
      render json: output
    end
  end
end
