require 'rails_helper'

RSpec.describe FieldComponent, type: :component do
  let(:form) { double(:form) }

  it 'calls the form to create a text field' do
    expect(form).to receive(:text_field) do |name, options|
      expect(name).to eq(:email)
      expect(options[:type]).to eq('text')
    end

    render_inline(FieldComponent.new(:email, form: form))
  end
end
