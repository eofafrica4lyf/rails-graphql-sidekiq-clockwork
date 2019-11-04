web: bin/rails server -p $PORT -e $RAILS_ENV
release: bundle exec rails db:migrate
weatherworker: bundle exec sidekiq -c 2
scheduler: bundle exec clockwork config/clock.rb