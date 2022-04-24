class CasesController < ApplicationController
    
    # TODO make sure loading JS into edit template is secure
    # protect_from_forgery except: :edit
    # http_basic_authenticate_with name: "blake", password: "secret"

    before_action :require_user, only: [:index]

    def index
        @cases = Case.all
    end

    def show
        @case = Case.find(params[:id])
    end

    def edit
        #@cases = Case.all
        #@case = Case.find(params[:id])
    end

    def update
        @case = Case.find(params[:id])
        if @case.update(case_params)
            redirect_to root_path
        else
            render "Oops"
        end
    end

    # TODO issue here with redirecting to cases when no case has hours_reported?
    def import
        Case.import(params[:file])
        redirect_to "/cases", notice: "Data imported"
    end

    private
    def case_params
        params.require(:case).permit(
            client_attributes: [:id, :clientname],
            attorney_attributes: [:id, :firm, :name, :bill_rate_hr], 
            report_attributes: [:id, :hours_volunteered]
        )
    end
end

