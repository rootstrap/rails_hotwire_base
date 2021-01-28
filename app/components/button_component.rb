# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(text: nil, css_class: [], **options)
    super
    @text = text
    @css_class = Array(css_class)
    @options = options
  end

  private

  def css_classes
    base_classes + @css_class
  end

  def base_classes
    %w[
      group
      relative
      w-full
      flex
      justify-center
      py-2
      px-4
      border
      border-transparent
      text-sm
      font-medium
      rounded-md
      text-white
      bg-black
      hover:bg-gray-700
      focus:outline-none
      focus:ring-2
      focus:ring-offset-2
    ]
  end
end
