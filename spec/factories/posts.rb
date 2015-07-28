FactoryGirl.define do
  factory :post do
    title "MyString"
    description "This is test description"
    picture { File.new("#{Rails.root}/app/assets/images/sample.jpg") }
    user_id 1
  end

end
