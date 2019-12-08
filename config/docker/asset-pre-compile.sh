#! /bin/sh

# Precompile assets for production
# bundle exec rake assets:precompile 
bundle exec rake assets:precompile RAILS_ENV=production

echo "Assets Pre-compiled!"