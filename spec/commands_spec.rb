require_relative 'spec_helper'

describe EM::P::Redis, "The redis client" do
  it "should be able to PING" do
    pending "exercise"
    EM.run do
      redis = EM::P::Redis.connect
      redis.ping { |r| r.should == "PONG"; EM.stop; }
    end
  end

  it "should be able to ECHO" do
    pending "exercise"
    EM.run do
      redis = EM::P::Redis.connect
      redis.echo("Hello World!") { |r| r.should == "Hello World!"; EM.stop; }
    end
  end

  it "should be able to SET value for a key"
  it "should be able to GET the value given a key"
  it "should be able to INCR, increment the integer value of a key"
  it "should be able to SADD add one or more members to a set"
  it "should be able to SMEMBERS get all the members of a set"
end
