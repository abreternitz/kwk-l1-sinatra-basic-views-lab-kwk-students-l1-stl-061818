require 'bundler'
Bundler.require
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
  	set :views, "views"
  end  
  
  get '/' do
    erb :index
  end  
  
def quiz(location, hands, active, work, outgoing)
    outdoors = 0
    sports = 0
    mind = 0
    performing = 0
    arts = 0
    if location == "outdoors"
        outdoors += 1
        sports += 1 
    elsif location == "indoors"
        mind +=1 
        performing += 1
        arts += 1
        sports += 1
    elsif location == "none"
        sports += 1
        outdoors += 1
        mind += 1 
        performing += 1
        arts += 1
    end
    
    if hands == "yes" 
        arts += 1
    elsif hands == "no"
        sports += 1
        outdoors += 1
        mind += 1 
        performing += 1
    end
    
    if active == "yes"
        outdoors += 1
        sports += 1
    elsif active == "no"
        mind += 1 
        performing += 1
        arts += 1
    end
    
    if work == "alone"
        sports += 1
        outdoors += 1
        mind += 1
        arts += 1
    elsif work == "others"
        performing += 1
        sports += 1
        outdoors += 1
    end
    
    if outgoing == "yes"
       performing += 1
       sports += 1
       outdoors += 1
    elsif outgoing == "no"
       sports += 1
       outdoors += 1
       mind += 1
       arts += 1
   end
   
   if sports>performing && sports>outdoors && sports>arts && sports>mind
        "You should try some indoor sports! It'll benefit you physically. Check out the Indoor Sports section for some suggestions. "
    elsif mind>performing && mind>outdoors && mind>arts && mind>sports
        "You should try something challenging to the mind. Please look in the ming challenge section."
    elsif arts>performing && arts>outdoors && arts>mind && arts>sports
        "You should try something art related! You are creative and your creativity can help with your projects. Please look at the art category to see what some options are!"
    elsif performing>arts && performing>outdoors && performing>mind && performing>sport
        "You should try performing arts. It'll give you a good challenge."
    elsif outdoors>arts && outdoors>mind && outdoors>sports && outdoors>performing
        "You should try something adventurous. You shoud look in the outdoor section."
    else
        "You should try a mix. Please check all categories."
    end 
end