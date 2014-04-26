require_dependency "yawl_rails/application_controller"

module YawlRails
  class StepsController < ApplicationController
    def show
      @process = ::Yawl::Process.first(:name => params[:process_id])
      @step = @process.steps_dataset.first(:id => params[:id])

      respond_to do |format|
        format.html
        format.json { render :json => @step.to_hash.merge(:attempts => @step.attempts.map(&:to_hash)) }
      end
    end
  end
end
