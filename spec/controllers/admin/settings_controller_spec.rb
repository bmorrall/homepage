require 'spec_helper'

describe Admin::SettingsController do

  describe '#show' do
    context 'with unuathorized User' do
      before(:each) do
        get :show
      end
      it { response.should redirect_to root_url }
      it { flash[:notice].should == "Successfully authenticated from Facebook account."}
    end
    context 'with authorized User' do
      before(:each) do
        user = FactoryGirl.create(:user)
        sign_in user
      end
      it 'should raise CanCan::AccessDenied' do
        lambda {
          get :show
        }.should raise_error(CanCan::AccessDenied)
      end
    end
  end

end

