FactoryGirl.define do
  
  # date random generator
  sequence :date do |n|
    (0..n).to_a.sample.days.ago.to_date
  end

  # email random generator
  sequence :email do |n|
    "test_#{n}@welcome.com"
  end

  factory :schedule_item do
    skip_create

    date 
    transfer_available_from "13:30"
    transfer_available_to "16:30" 
    request_available_from "11:30"
    request_available_to "17:30"    
  end # of schedule_item factory

  factory :schedule do
    skip_create

    schedule_items {build_list(:schedule_item, 4)}
  end # of schedule factory

  factory :driver_session do
    skip_create

    email
    password 'password'
  end # of driver factory

end # of FactoryGirl
