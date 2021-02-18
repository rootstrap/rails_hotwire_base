namespace :feature_flags do
  desc 'Initialize and turn off all the new feature flags so they are available in the dashboard'
  task initialize: :environment do
    # The list of feature flags the application starts with
    feature_flags = ['test']

    # Initialize the feature flags
    feature_flags.each do |feature_flag|
      next if Flipper.exist?(feature_flag)

      Flipper.disable(feature_flag)
    end
  end
end
