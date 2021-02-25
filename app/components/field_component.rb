# frozen_string_literal: true

class FieldComponent < ViewComponent::Base
  def initialize(name, form:, type: 'text', css_class: [], **options)
    super
    @name = name
    @type = type
    @form = form
    @css_class = Array(css_class)
    @options = options.except(:form)
  end

  private

  def css_classes
    base_classes + @css_class
  end

  def base_classes
    %w[
      appearance-none
      rounded-md
      relative
      block
      w-full
      px-3
      py-2
      border
      border-gray-300
      placeholder-gray-500
      text-gray-900
      focus:outline-none
      focus:ring-black
      focus:border-black
      focus:z-10
      sm:text-sm
    ]
  end
end
