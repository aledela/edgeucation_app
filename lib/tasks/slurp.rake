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
  
  namespace :slurp do
  desc "TODO"
  task filer: :environment do
    require "csv"
    majorsfile = "List_Major_Subjects.csv"
    csv_text1 = File.read(Rails.root.join("lib", "csvs", majorsfile))
    csv1 = CSV.parse(csv_text1, :headers => true,  :encoding => "ISO-8859-1")
    csv1.each do |row|
      majorname = row["Majors List"]
      major = Major.create(subject: majorname) 
      filename = majorname + ".csv"
      csv_text = File.read(Rails.root.join("lib", "csvs", filename))
      csv = CSV.parse(csv_text, :headers => true,  :encoding => "ISO-8859-1")
      csv.each do |row|
        puts row["Institution"]
        if(College.exists?(:coll_name => row["Institution"]))
          college = College.find_by(:coll_name => row["Institution"])
          college.college_majors.create(major: major)
        else
          puts "The institution: #{row["Institution"]} under the major: #{majorname} does not exist in the College model"
        end
      end
    end
  end
end
  
  namespace :slurp do
  desc "TODO"
  task addmodel: :environment do
    college = College.create(coll_name: 'Grinnell College', zip_code:33614, cost_att: 30000)
    college2 = College.create(coll_name: 'University of Florida', zip_code:33616, cost_att: 40000)
    major = Major.create(subject: 'Math')
    college.college_majors.create(major: major)
    college2.college_majors.create(major: major)
    puts college.majors.subject
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

