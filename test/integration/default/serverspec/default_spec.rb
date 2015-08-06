require 'spec_helper'
require 'net/http'

describe 'apache::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'serves up the home page' do
    expect(command('curl http://localhost').exit_status).to eq 0
  end
 
  it 'returns a 200 status code' do
    # uri = URI('http://localhost')
    # res = Net::HTTP.get_response(uri)
    # expect(res.code).to eq '200'
    expect(Net::HTTP.get_response(URI('http://localhost')).code).to eq '200'
  end

  it 'enables httpd to start on reboot' do
    expect(service 'httpd').to be_enabled
  end

  it 'is listening on port 80' do
    expect(port 80).to be_listening
  end  
end
