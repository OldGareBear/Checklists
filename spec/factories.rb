FactoryGirl.define do
  factory :user, aliases: [:author] do
    username 'gary'
    password '12345'
  end

  factory :checklist do
    title 'A checklist'
  end

  factory :item do
    text 'some text'
    checklist
  end
end