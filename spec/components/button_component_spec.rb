require 'rails_helper'

RSpec.describe ButtonComponent, type: :component do
  it 'renders the given text inside a button' do
    expect(
      render_inline(ButtonComponent.new(text: 'Some text')).css('button').to_html
    ).to include('Some text')
  end

  it 'allows setting custom classes' do
    expect(
      render_inline(ButtonComponent.new(text: 'Some text', css_class: 'some-class')).css('button.some-class').to_html
    ).to include('Some text')
  end

  it 'allows setting custom options' do
    expect(
      render_inline(ButtonComponent.new(text: 'Some text', type: 'submit')).css('button[type="submit"]').to_html
    ).to include('Some text')
  end
end
