require './dropbox'

use Rack::ShowExceptions

run Dropbox.new
