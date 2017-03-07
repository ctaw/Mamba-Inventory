if User.all.blank?
  User.create(:email => 'mambaph@gmail.com', :password => 'password', :password_confirmation => 'password')
end
