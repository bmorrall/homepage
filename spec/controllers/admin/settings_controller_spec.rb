require 'spec_helper'

describe Admin::SettingsController do

  describe '#show' do
    context 'with no User session' do
      before(:each) do
        get :show
      end
      it { response.should redirect_to new_user_session_path }
    end
    context 'with unuathorized User' do
      login_unauthorized_user

      context 'with a valid request' do
        before(:each) do
          get :show
        end
        it { should render_template(:file => 'public/403.html') }
      end
    end
    context 'as a User with read Settings permissions' do
      login_user_with_ability :read, Settings

      context 'with a valid request' do
        before(:each) do
          get :show
        end
        it { should render_template('show') }
      end
    end
  end

  describe '#create' do
    context 'with no User session' do
      before(:each) do
        post :create
      end
      it { response.should redirect_to new_user_session_path }
    end
    context 'with unuathorized User' do
      login_unauthorized_user

      context 'with a valid request' do
        before(:each) do
          post :create
        end
        it { should render_template(:file => 'public/403.html') }
      end
    end
    context 'as User with create Settings permissions' do
      login_user_with_ability :create, Settings

      context 'with a valid params' do
        it 'should update the analytics_account property on Settings' do
          Settings.should_receive("[]=").with('analytics_account', 'UA-123456789')
          post :create, { settings: { :analytics_account => 'UA-123456789' }}
        end
      end
    end
  end

end

