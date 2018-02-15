# frozen_string_literal: true

module ApplicationHelper
  def display_style(flag)
    flag ? 'display: none' : 'display: block'
  end
end
