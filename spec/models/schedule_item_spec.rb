require 'rails_helper'

describe ScheduleItem, type: :model do
	describe "initialization" do
    
    it "should have all fields in proper format" do
      schedule_item = build(:schedule_item)
      expect( schedule_item ).to be_valid

      schedule_item = build(:schedule_item, transfer_available_from: nil)
      expect( schedule_item ).not_to be_valid

      schedule_item = build(:schedule_item, date: nil)
      expect( schedule_item ).not_to be_valid
      
      schedule_item = build(:schedule_item, transfer_available_from: 'invalid format')
      expect( schedule_item ).not_to be_valid
    end

    it "should calculate transfer and request availability periods in minutes" do
      schedule_item = build(:schedule_item)
      expect( schedule_item ).to be_valid

      schedule_item.calculate_availability
      
      expect( schedule_item.transfer_availablity ).to eq 180
      expect( schedule_item.request_availablity ).to be 360
    end
    
  end
end
