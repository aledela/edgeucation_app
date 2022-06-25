#CollegeData.csv file contains the complete, most up-to-date data for every college. Other 
# Latest method to create colleges and add majors to it
namespace :slurp do
  desc "TODO"
  task colMajorfiller: :environment do
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
          s.college_majors.create(major: major)
        end
      end
    end
  end
  
  # Get one image from the Google Image Search Api (SerpApi.com) to check the API call was successful
  task imageApi: :environment do
    require 'google_search_results' 
    params = {
      q: "Apple",
      tbm: "isch",
      ijn: "0",
      api_key: "612ad8e6a99ac298be5d784e3049f548b17c2731ca766733a788b100f6b14cf8"
    }
    
    search = GoogleSearch.new(params)
    image_results_list = search.get_hash[:images_results]
    puts image_results_list.first(:original)
  end

# Method to fill all of the image and logo_image attributes for colleges with the default background image and logo image
  task fillImage: :environment do
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "CollegeData.csv"))
    csv = CSV.parse(csv_text, :headers => true,  :encoding => "ISO-8859-1")
    csv.each do |row|
      if(College.exists?(:coll_name => row["instnm"]))
        s = College.find_by(:coll_name => row["instnm"])
        s.image = "University_College.jpg"
        s.logo_image = "Default Logo Image.png"
        s.save
      end
    end
  end


# finds background image and logo image for each college and assigns the corresponding urls to college.image and college.logo_image
  task imageApiCol: :environment do
    require 'google_search_results' 
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "TestingFileColleges2.csv"))
    #The file name should be changed to CollegeData.csv onve testing is completed and the method should be changed to read the file correctly.
    #The current file is meant for testing purposes. Since the Api version is currently free, only 100 calls a month can be made and thus a 
    #testing file with less than 100 colleges should be used.
    csv = CSV.parse(csv_text, :headers => true,  :encoding => "ISO-8859-1")
    csv.each do |row|
      if(College.exists?(:coll_name => row["instnm"]))
        params = {
          q: row["instnm"] + " campus",
          tbm: "isch",
          ijn: "0",
          api_key: "612ad8e6a99ac298be5d784e3049f548b17c2731ca766733a788b100f6b14cf8"
        }
        paramsLogo = {
          q: row["instnm"] + " logo",
          tbm: "isch",
          tbs: "itp:photos,isz:i",
          ijn: "0",
          api_key: "612ad8e6a99ac298be5d784e3049f548b17c2731ca766733a788b100f6b14cf8"
        }
        
        search = GoogleSearch.new(params)
        image_results_list = search.get_hash[:images_results]
        imageResult =  image_results_list.first()
        
        searchLogo = GoogleSearch.new(paramsLogo)
        image_results_listLogo = searchLogo.get_hash[:images_results]
        imageResultLogo =  image_results_listLogo.first()
        
        s = College.find_by(:coll_name => row["instnm"])
        s.image = imageResult[:original]
        s.logo_image = imageResultLogo[:original]
        s.save
      end
    end
  end

end