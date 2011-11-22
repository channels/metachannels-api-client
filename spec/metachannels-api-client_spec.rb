require File.join(File.dirname(__FILE__), %w[spec_helper])
require 'metachannels-api-client'

describe MetachannelsApi do
  context "instance methods" do
    context "#initialize" do
      it "should default the api endpoint to #{MetachannelsApi::DEFAULT_API_ENDPOINT}" do
        subject.end_point.should == MetachannelsApi::DEFAULT_API_ENDPOINT
      end
    end
  end
end