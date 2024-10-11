# frozen_string_literal: true

RSpec.describe KTemplate do
  it 'has a version number' do
    expect(KTemplate::VERSION).not_to be_nil
  end

  context 'when cmdlet gem is available' do
    it 'has cmdlet working' do
      expect(Cmdlet::Case::Dash.new.call('david cruwys')).to eq('david-cruwys')
    end
  end

  context 'when handlebarsjs gem is available' do
    let(:dash_helper) { Handlebarsjs::Helpers::Case::Dash.new }
    let(:title_helper) { Handlebarsjs::Helpers::Case::Title.new }
    let(:handlebars) { Handlebarsjs::Handlebars.new }

    before do
      handlebars.handlebars_snapshot.add_helper(:dash, dash_helper)
      handlebars.handlebars_snapshot.add_helper(:title, title_helper)
    end

    describe '#process_template' do
      subject { handlebars.process_template(template, data).squish }

      let(:data) { { value: 'the quick brown fox' } }

      let(:template) { '{{title value}}: {{dash value}}' }

      it { is_expected.to eq('The Quick Brown Fox: the-quick-brown-fox') }
    end
  end
end
