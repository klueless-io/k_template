# frozen_string_literal: true

RSpec.describe KTemplate do
  it 'has a version number' do
    expect(KTemplate::VERSION).not_to be_nil
  end

  it 'has a standard error' do
    expect { raise KTemplate::Error, 'some message' }
      .to raise_error('some message')
  end
end
