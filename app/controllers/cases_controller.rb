class CasesController < ApplicationController
    def index
        @cases = Case.all
    end

    def show
        @case = Case.find(params[:id])
    end

    def update
        @case = Case.find(params[:id])

        if @case.update(case_params)
            redirect_to @case
        else
            render "Oops"
        end
    end

    private
    def case_params
        params.require(:case).permit(:client, :attorney, :report)
    end
end
