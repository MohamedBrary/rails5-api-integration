require 'rails_helper'

describe DriverSession, type: :model do
	describe "initialization" do
    
    it "should has email and passwords in proper format" do
      driver_session = build(:driver_session)
      expect( driver_session ).to be_valid

      driver_session = build(:driver_session, email: nil)
      expect( driver_session ).not_to be_valid

      driver_session = build(:driver_session, password: nil)
      expect( driver_session ).not_to be_valid

      driver_session = build(:driver_session, email: 'invalid format')
      expect( driver_session ).not_to be_valid
    end

    it "should authenitcate with the api and retrieve a token" do
      driver_session = build(:driver_session) # has 4 items with identical periods

      expect( driver_session.token ).not_to be nil      
    end
    
  end
end
