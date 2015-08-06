require 'spec_helper'

describe 'apache::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'serves up the home page' do
    expect(command('curl http://localhost').exit_status).to eq 0
  end
 
  it 'enables httpd to start on reboot' do
    expect(service 'httpd').to be_enabled
  end

  it 'is listening on port 80' do
    expect(port 80).to be_listening
  end  
end
