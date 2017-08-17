# # encoding: utf-8

# Inspec test for recipe mongo::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe port(27017) do
  it { should be_listening }
end

describe package('mongodb-org') do
	it { should be_installed }
end

describe service('mongod') do
	it { should be_running }
end

describe service('mongod') do
	it { should be_enabled }
end