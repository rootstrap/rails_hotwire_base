# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(text: nil, css_class: [], options: {})
    super
    @text = text
    @css_class = css_class
    @options = options
  end

  private

  def css_classes
    base_classes + @css_class
  end

  def base_classes
    %w[
      flex-shrink-0
      bg-black
      text-white
      text-base
      font-semibold
      py-2
      px-4
      rounded-lg
      shadow-md
      hover:bg-gray-700
      focus:outline-none
      focus:ring-2
      focus:ring-black
      focus:ring-offset-2
      focus:ring-offset-purple-200
      cursor-pointer
    ]
  end
end
