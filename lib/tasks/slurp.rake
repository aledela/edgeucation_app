# namespace :slurp do
#   desc "TODO"
#   task colleges: :environment do
#     require "csv"
#     csv_text = File.read(Rails.root.join("lib", "csvs", "Inst_by_zip_cost copy.csv"))
#     csv = CSV.parse(csv_text, :headers => true,  :encoding => "ISO-8859-1")
#     csv.each do |row|
#       if(!College.exists?(:coll_name => row["Institution"]))
#         s = College.new
#         s.coll_name = row["Institution"]
#         s.zip_code = row["ZIP"]
#         s.cost_att = row["Cost"]
#         s.save
#       end
#     end
#   end
# end
  
#   namespace :slurp do
#   desc "TODO"
#   task filer: :environment do
#     require "csv"
#     majorsfile = "List_Major_Subjects.csv"
#     csv_text1 = File.read(Rails.root.join("lib", "csvs", majorsfile))
#     csv1 = CSV.parse(csv_text1, :headers => true,  :encoding => "ISO-8859-1")
#     csv1.each do |row|
#       majorname = row["Majors List"]
#       major = Major.create(subject: majorname) 
#       filename = majorname + ".csv"
#       csv_text = File.read(Rails.root.join("lib", "csvs", filename))
#       csv = CSV.parse(csv_text, :headers => true,  :encoding => "ISO-8859-1")
#       csv.each do |row|
#         if(College.exists?(:coll_name => row["instnm"]))
#           college = College.find_by(:coll_name => row["instnm"])
#           college.college_majors.create(major: major)
#         else
#           puts "The institution: #{row["instnm"]} under the major: #{majorname} does not exist in the College model"
#         end
#       end
#     end
#   end
# end
  
#   namespace :slurp do
#   desc "TODO"
#   task addmodel: :environment do
#     require "csv"
#     majorsfile = "Agriculture Operations and Related Sciences.csv"
#     csv_text1 = File.read(Rails.root.join("lib", "csvs", majorsfile))
#     csv1 = CSV.parse(csv_text1, :headers => true,  :encoding => "ISO-8859-1")
#     csv1.each do |row|
#     puts row["instnm"]
#   end
# end
# end

#   namespace :slurp do
#   desc "TODO"
#   task clearmodels: :environment do
#     College.delete_all
#     Major.delete_all
# end
# end
  
# namespace :slurp do
#   desc "TODO"
#   task newfiler2: :environment do
#     require "csv"
#     csv_text = csv_text = File.read(Rails.root.join("lib", "csvs", "CollegeData.csv"))
#     csv = CSV.parse(csv_text, :headers => true,  :encoding => "ISO-8859-1")
#     csv.each do |row|
#       if(College.exists?(:coll_name => row["instnm"]))
#         s = College.find_by(:coll_name => row["instnm"])
#         s.zip_code = row["ZIP code"]
#         s.save
#       end
#     end
#   end
# end

namespace :slurp do
  desc "TODO"
  task newfiler: :environment do
    require "csv"
    csv_text = csv_text = File.read(Rails.root.join("lib", "csvs", "CollegeData.csv"))
    csv = CSV.parse(csv_text, :headers => true,  :encoding => "ISO-8859-1")
    headers = csv.headers()
    csv.each do |row|
      if(!College.exists?(:coll_name => row["instnm"]))
        s = College.new
        s.coll_name = row["instnm"]
        s.zip_code = row["ZIP code"]
        s.cost_att = row["Cost of Attendance"]
        s.save
      else
        s = College.find_by(:coll_name => row["instnm"])
      end
      for i in 3...headers.size do
        majorrow = row[headers[i]]
        majorname = headers[i]
        if(!majorrow.nil? && majorrow.to_i>=1)
          if(!Major.exists?(:subject => majorname))
            major = Major.create(subject: majorname)
          else
            major = Major.find_by(:subject => majorname)
          end
          s.college_majors.create(major: major)\
        end
      end
    end
  end
end
# namespace :slurp do
#   desc "TODO"
#   task newfiler3: :environment do
#     require "csv"
#     csv_text = csv_text = File.read(Rails.root.join("lib", "csvs", "CollegeData.csv"))
#     csv = CSV.parse(csv_text, :headers => true,  :encoding => "ISO-8859-1")
#     headers = csv.headers()
#       csv.each do |row|
#           puts row["instnm"]
#           puts row["ZIP Code"]
#           puts row["Cost of Attendance"]
#           for i in 3...headers.size do
#             if(row[headers[i]].nil?)
#               puts "empty"
#             else
#               puts row[headers[i]]
#             end
#           end
#       end
#   end
# end
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

