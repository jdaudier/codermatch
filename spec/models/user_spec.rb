require 'spec_helper'  

describe User do 

  context 'when a user chooses zipcode' do
    # This only adds user to TEST database, not our actual database. The Test DB is refreshed each time test is run so user is not permanently saved to Test DB.
    let(:pudding) {User.create(zipcode: '78722')}
    it 'adds latitude and longitude to their user object' do
       expect(pudding.latitude).not_to eq(nil) 
       expect(pudding.longitude).not_to eq(nil)
    end
  end
end



