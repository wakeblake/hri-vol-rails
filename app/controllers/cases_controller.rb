class CasesController < ApplicationController
    
    # TODO make sure loading JS into edit template is secure
    #protect_from_forgery except: :edit

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

    private
    def case_params
        params.require(:case).permit(
            client_attributes: [:id, :clientname],
            attorney_attributes: [:id, :firm, :name, :bill_rate_hr], 
            report_attributes: [:id, :hours_volunteered]
        )
    end
end

