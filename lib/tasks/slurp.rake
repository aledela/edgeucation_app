namespace :slurp do
  desc "TODO"
  task colleges: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "Inst_by_zip_cost copy.csv"))
    csv = CSV.parse(csv_text, :headers => true,  :encoding => "ISO-8859-1")
    csv.each do |row|
    s = College.new
    s.coll_name = row["Institution"]
    s.zip_code = row["ZIP"]
    s.cost_att = row["Cost"]
    s.save
    end
  end
end
