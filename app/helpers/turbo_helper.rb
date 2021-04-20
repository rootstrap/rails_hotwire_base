# frozen_string_literal: true

module TurboHelper
  def accept_turbo_stream_response
    { data: { controller: 'turbo-streams', action: 'turbo-streams#injectHeaders' } }
  end
end
