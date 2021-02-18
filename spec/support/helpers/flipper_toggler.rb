module Helpers
  module FlipperToggler
    def toggle_on(feature_flag)
      allow_any_instance_of(Flipper).to receive(:enabled?).with(feature_flag).and_return(true)
    end

    def toggle_off(feature_flag)
      allow_any_instance_of(Flipper).to receive(:enabled?).with(feature_flag).and_return(false)
    end
  end
end
