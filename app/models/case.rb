class Case < ApplicationRecord
  belongs_to :attorney
  belongs_to :client
  has_one :report, dependent: :destroy

  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :attorney
  accepts_nested_attributes_for :report

  require 'csv'

  def self.import(file)
    case_list = []
    fy = Date.today.month < 7 ? Date.new(Date.today.year, 6, 30) : Date.new(Date.today.year + 1, 6, 30)

    CSV.foreach(file.path, headers: true) do |row|
      case_list.append(row.to_hash)
    end

    # TODO how to do this dynamically?
    for c in case_list
      a = Attorney.create(name: c["All Pro Bonos (Last, First)"], email: c["Email Address"], firm: c["Organization Name"])
      cl = a.clients.create(clientname: c["Client/Applicant"])
      cs = Case.create(attorney: a, client: cl, legal_server_case_id: c["Case ID#"])
      cs.create_report(fiscal_year: fy)
    end
  end
      
end
