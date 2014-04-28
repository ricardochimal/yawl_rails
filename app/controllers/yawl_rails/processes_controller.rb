require_dependency "yawl_rails/application_controller"

module YawlRails
  class ProcessesController < ApplicationController
    before_filter :load_process, only: [:show, :restart, :steps]

    def index
      page = (params[:page] || 1).to_i
      @processes = ::Yawl::Process.pagination_dataset.order(:id).reverse.paginate(page, Yawl::Config.pagination_per_page)

      respond_to do |format|
        format.html
        format.json { render :json => @processes }
      end
    end

    def show
      respond_to do |format|
        format.html
        format.json { render :json => @process.to_hash.merge(:steps => @process.steps.map(&:to_hash)) }
      end
    end

    def restart
      @process.start_first_unfinished_step

      respond_to do |format|
        format.html { redirect_to yawl_process_path(@process.id), :status => 303 }
        format.json { render :json => @process.to_hash, :location => yawl_process_url(@process.id) }
      end
    end

    def steps
      respond_to do |format|
        format.html { render :partial => "step_rows" }
        format.json { render :json => @process.to_hash.merge(:steps => @process.steps.map(&:to_hash)) }
      end
    end

    protected

    def load_process
      @process = ::Yawl::Process.first(:name => params[:id])
      if @process.nil?
        respond_to do |format|
          format.html { render :text => "Process not found", :status => 404 }
          format.json { render :json => { "error" => "Process not found" }, :status => 404 }
        end
        false
      end
    end
  end
end
