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

      if params['email'].present? && params['message'].present?
        ActionMailer::Base.mail( from: "test@example.com", to: params['email'], subject: "Backend Email", body: params['message'] ).deliver_now
      end
      
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
