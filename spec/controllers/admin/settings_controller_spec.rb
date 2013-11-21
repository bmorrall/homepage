require 'spec_helper'

describe Admin::SettingsController do

  describe '#show' do
    context 'with unuathorized User' do
      before(:each) do
        get :show
      end
      it { response.should redirect_to new_user_session_path }
    end
    context 'with authorized User' do
      before(:each) do
        user = FactoryGirl.create(:user)
        sign_in user
      end
      context 'with a valid request' do
        before(:each) do
          get :show
        end
        it { should render_template(:file => 'public/403.html') }
      end
    end
  end

end

