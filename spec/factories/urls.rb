FactoryBot.define do
  factory :url do
    original_url { 'http://www.google.com' }
    short_url { 'sadf' }
  end

  trait :skip_validate do
    to_create {|instance| instance.save(validate: false)}
  end
end
