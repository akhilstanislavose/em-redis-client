require_relative 'spec_helper'

describe EM::P::Redis, "The Redis Commands" do
  it "should be able to PING" do
    EM.run do
      redis = EM::P::Redis.connect
      redis.ping { |r| r.should == "PONG"; EM.stop; }
    end
  end

  it "should be able to ECHO" do
    EM.run do
      redis = EM::P::Redis.connect
      redis.echo("Hello World!") { |r| r.should == "Hello World!"; EM.stop; }
    end
  end

  it "should support nested commands" do
    pending "not supported. todo."
    EM.run do
      redis = EM::P::Redis.connect
      redis.ping do |response_ping|
        # will be executed only when response_ping arrives through the network
        redis.echo("message in a bottle") do |response_echo|
          # test will be executed only when response_echo arrives through the network
          response_ping.should == "PONG"
          response_echo.should == "message in a bottle"
        end
      end
      # immediately executed. Does not wait for nested commands above.
    end
  end
end
