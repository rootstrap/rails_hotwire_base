# frozen_string_literal: true

class FieldComponent < ViewComponent::Base
  def initialize(name, form:, type: 'text', css_class: [], **options)
    super
    @name = name
    @type = type
    @form = form
    @css_class = css_class
    @options = options
  end

  private

  def css_classes
    base_classes + @css_class
  end

  def base_classes
    %w[
      flex-1
      appearance-none
      border
      border-transparent
      w-full
      py-2
      px-4
      bg-white
      text-gray-700
      placeholder-gray-400
      shadow-md
      rounded-md
      text-base
      focus:outline-none
      focus:ring-2
      focus:ring-black
      focus:border-transparent
    ]
  end
end
