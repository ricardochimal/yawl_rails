require_dependency "yawl_rails/application_controller"

module YawlRails
  class ProcessesController < ApplicationController
    def index
      @processes = Yawl::Process.order(:id).reverse

      respond_to do |format|
        format.html
        format.json { render :json => @processes }
      end
    end

    def show
      @process = Yawl::Process.first(:id => params[:id])

      respond_to do |format|
        format.html
        format.json { render :json => @process.to_hash.merge(:steps => @process.steps.map(&:to_hash)) }
      end
    end

    def restart
      @process = Yawl::Process.first(:id => params[:id])
      @process.start_first_unfinished_step

      respond_to do |format|
        format.html { redirect_to yawl_process_path(@process.id), :status => 303 }
        format.json { render :json => @process.to_hash, :location => yawl_process_url(@process.id) }
      end
    end

    def steps
      @process = Yawl::Process.first(:id => params[:id])

      respond_to do |format|
        format.html { render :partial => "step_rows" }
        format.json { render :json => @process.to_hash.merge(:steps => @process.steps.map(&:to_hash)) }
      end
    end
  end
end
