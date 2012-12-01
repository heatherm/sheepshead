if Rails.env.test? || Rails.env.development?
  namespace :spec do
    desc "run all specs & jasmine"
    task all: :environment do
      Rake::Task["default"].invoke && Rake::Task["jasmine:ci"].invoke
    end
  end
end
