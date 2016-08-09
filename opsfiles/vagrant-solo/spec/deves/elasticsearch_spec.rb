require 'spec_helper'

describe package('jdk1.8.0_45') do
  it { should be_installed }
end

describe service('elasticsearch') do
  it { should be_enabled }
  it { should be_running }
end

PORTS=['9200', '9300']
PORTS.each do |port|
  describe port("#{port}") do
    it { should be_listening }
  end
end

describe command('curl http://192.168.33.31:9200 -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end
