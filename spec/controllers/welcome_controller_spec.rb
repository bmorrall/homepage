require 'spec_helper'

describe WelcomeController do

  describe '#index' do
    context 'with unuathorized user' do
      before(:each) { get :index }
      it { should render_template(:index) }
      it { should render_with_layout(:application) }
      it { should respond_with_content_type(:html) }
      it { should_not set_the_flash }
    end
  end

end

