echo "Setting up dummy Redmine 2.2-stable"
git clone https://github.com/edavis10/redmine.git -b 2.2-stable spec/dummy_redmine
cd spec/dummy_redmine
echo "Copying database.yml"
cp ../ci_config/database.ci.yml config/database.yml
echo "Cloning the plugin to dummy Redmine plugins folder"
git clone ../.. plugins/redmine_better_gantt_chart
echo "Migrating database"
RAILS_ENV=test bundle exec rake db:create db:migrate redmine:plugins:migrate
bundle install
