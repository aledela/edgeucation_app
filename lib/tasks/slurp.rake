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
  
  
#     task majors: :environment do
#     require "csv"
#     # Parsing through data in CSV file for the Major model
# 	  csv_text_majors = File.read(Rails.root.join("lib", "csvs", "majors.csv"))
#     csv_majors = CSV.parse(csv_text_majors, :headers => true,  :encoding => "ISO-8859-1")
#     csv_majors.each do |row2|
#       m = Major.new
#       m.name = row["Major"]
#       m.description = row["Description"]
#       m.save
#     end
#   end
 
#     task college_major: :environment do
#     require "csv"
#     # Parsing through data in CSV file for the Major model
#     @majors.each do |major|
#   	  csv_text = File.read(Rails.root.join("lib", "csvs", "major.name.csv"))
#       csv = CSV.parse(csv_text, :headers => true,  :encoding => "ISO-8859-1")
#       csv.each do |row|
#         colleges.name = row["Institution"]
#         major.college_majors.create(college: colleges.name)
#       end
#     end
#   end 
  
  
  
#   major.college_majors.create(client: client)
  
#   task places: :environment do
# results = Geocoder.search("Paris")

#     puts results.first.coordinates
#   end
  
#   # task time: :environment do
#   #   require 'timezone'
#   #   puts timezone = Timezone.lookup(89, 40)
#   # end
  
# end
