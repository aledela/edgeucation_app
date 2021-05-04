class ApplicationController < ActionController::Base
  
   def test
     render html: "Testing 1,2,3!"
   end
end