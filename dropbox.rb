require "bundler/setup"
require "sinatra"

class Dropbox < Sinatra::Application
  get "/" do 
    name ||= 'default user'
    "Hello #{name}. I am a web service"
  end

  # Get all files that are either audio or video
  get "/files" do
    ["one.mp4", "two.mp3", "three.mov"]
  end

  # Return only files that are either audio or video
  format ||= 'other'
  get "/files/:format" do |format|
    file_list = case format
      when format == 'video'
        ["one.mp4", "three.mov"]
      when format == 'audio'
	["two.mp3", "four.wav"]
      else
        "No files found for format #{format}"
      end
   
    file_list    
  end

  # Return information about a specific file in the dropbox (more than you
  # get from the general list
  get "/file/:id" do
  end

  # Return the location where the file resides in the dropbox. This can be
  # handed off to Matterhorn so that it can pull the file either over HTTP
  # or locally. Local is preferred to prevent overhead and will be the first
  # implementation
  get "/file/:id/path" do
  end

  # Get a list of all batches. Returns only the name and the identifier from
  # the bundle
  get "/batches" do
  end

  # Get information on a specific batch. This should return a manifest of all
  # files along with the status (whether it is ready for ingest and whether 
  # Avalon has begun to process its content)
  get "/batch/:id" do
  end
  
  # Return the raw bitstream of the metadata file. This should be mediated
  # by Avalon to keep the dropbox's purpose as simple as possible
  get "/batch/:id/metadata" do
  end

  # Register the PID(s) associated with a batch ingest. We need to think about
  # how this might work when you have more than one. For now it assumes that
  # there is a one to one mapping between batches and PIDs
  get "/batch/:id/pid" do
  end

  # Get the current status of the batch. This lets one know if the batch is
  # still in process or if it has been ingested. There should be a PUSH 
  # method for Avalon to update the Dropbox once it is done to prevent the
  # same batch being processed over and over again
  get "/batch/:id/status" do
  end
end
