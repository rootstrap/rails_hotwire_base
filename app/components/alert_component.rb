# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  attr_reader :role, :message

  def initialize(role:, message:, css_class: [])
    super
    @role = role.to_sym
    @message = message
    @css_class = Array(css_class)
  end

  def css_classes
    (base_classes + @css_class).join(' ')
  end

  private

  def base_classes
    [
      'flex',
      'justify-between',
      "bg-#{color}-100",
      "text-#{color}-700",
      'm-1',
      'px-4',
      'py-3',
      'rounded'
    ]
  end

  def color
    case role
    when :alert, :error
      :red
    when :success
      :green
    else
      :indigo
    end
  end
end
