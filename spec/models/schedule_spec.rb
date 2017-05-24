require 'rails_helper'

describe Schedule, type: :model do
	describe "initialization" do
    
    it "should calculate transfer and request availability periods totals and averages in minutes, for all items" do
      schedule_item = build(:schedule) # has 4 items with identical periods

      expect( schedule_item.transfer_availablity_total ).to_eq (4*180)
      expect( schedule_item.request_availablity_total ).to_be (4*360)

      expect( schedule_item.transfer_availablity_avg ).to_eq 180
      expect( schedule_item.request_availablity_avg ).to_be 360
    end
    
  end
end
