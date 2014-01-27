require 'spec_helper'

describe HighVoltage::PagesController do

  describe '#show' do
    context 'as a visitor' do
      %w(home).each do |page|
        context 'with GET to /#{page}' do
          before(:each) { get :show, id: page }
          it { should render_template(page) }
          it { should render_with_layout(:application) }
          it { response.content_type.should eq('text/html') }
          it { should_not set_the_flash }
        end
      end
    end
  end

end

