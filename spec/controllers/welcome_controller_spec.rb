require 'spec_helper'

describe WelcomeController do

  describe '#index' do
    context 'as a visitor' do
      before(:each) { get :index }
      it { should render_template(:index) }
      it { should render_with_layout(:application) }
      it { response.content_type.should eq('text/html') }
      it { should_not set_the_flash }
    end
  end

end

