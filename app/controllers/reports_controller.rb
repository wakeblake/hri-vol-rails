class ReportsController < ApplicationController
    def index
        @reports = Report.all #Report.find(params[])
    end
end
