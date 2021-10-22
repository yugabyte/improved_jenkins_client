require File.expand_path('../../../lib/improved_jenkins_client', __FILE__)
require 'logger'
require 'json'

RSpec.configure do |config|
  config.before(:each) do
  end
end

def load_json_from_fixture(file_name)
  JSON.load(
    File.read(
      File.expand_path(
        "../fixtures/files/#{file_name}",
        __FILE__
      )
    )
  )
end
