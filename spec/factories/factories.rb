FactoryGirl.define do 
  factory :user do 
    email "test@example.com"
    password "aaaaaaaa"
    password_confirmation "aaaaaaaa"
    confirmed_at Time.now
  end

  factory :upload do
    name "Anisha Dangol"
    file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public', 'uploads', 'upload', 'file', 'app-Sample_CVs.pdf'))}
  end
end