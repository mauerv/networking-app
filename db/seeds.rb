require 'uri'

# Default test user
	test_user = User.create(
		email: 'mauro@osn.global',
		password: 'asdasd',
		password_confirmation: 'asdasd' 
	)
	test_user.profile.update(
		name: 'Mauro Velazquez',
		title: "CEO at Battlepro",
		country: 'Argentina',
		description: 'Non-stop entrepreneur and obsesive problem solver. Interested in helping 
									advance and leverage new tech and science to help solve global problems. 
									Background as a tennis player and professional online poker player.'
	)
	url = FFaker::Avatar.image
	filename = File.basename(URI.parse(url).path)
	file = URI.open(url)

	test_user.profile.image.attach(io: file, filename: filename)

# Faker Profiles	
10.times do 
	fake_user = User.create(
		email: FFaker::Internet.email,
		password: 'password',
		password_confirmation: 'password' 
	)
	fake_user.profile.update(
		name: FFaker::Name.name,
		title: "#{FFaker::Job.title} at #{FFaker::Company.name}",
		country: FFaker::Address.country,
		description: FFaker::Lorem.paragraph
	)
	url = FFaker::Avatar.image
	filename = File.basename(URI.parse(url).path)
	file = URI.open(url)

	fake_user.profile.image.attach(io: file, filename: filename)
end

# Faking connections with test user
message = 'Hello, I would like to be your contact.'

ConnectionRequest.create(profile_id: test_user.id, contact_id: 2, request_message: message)
ConnectionRequest.create(profile_id: test_user.id, contact_id: 3)
ConnectionRequest.create(profile_id: 4, contact_id: test_user.id, request_message: message)
ConnectionRequest.create(profile_id: 5, contact_id: test_user.id)

# Faking connection requests with test user.
Connection.create(profile_id: test_user.id, contact_id: 6)
Connection.create(profile_id: 6, contact_id: test_user.id)
Connection.create(profile_id: test_user.id, contact_id: 7)
Connection.create(profile_id: 7, contact_id: test_user.id)
Connection.create(profile_id: test_user.id, contact_id: 8)
Connection.create(profile_id: 8, contact_id: test_user.id)