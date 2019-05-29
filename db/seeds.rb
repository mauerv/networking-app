require 'uri'

# Default test user.
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

# Faker Profiles.
150.times do 
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

message = 'Hello, I would like to be your contact.'
i = 2

# Create requests from test user to fake users.
35.times do
	# Alternate between containing and not containing request message.
	if i.even?
		ConnectionRequest.create(profile_id: test_user.id, contact_id: i, request_message: message)
	else 
		ConnectionRequest.create(profile_id: test_user.id, contact_id: i)	
	end
	i += 1
end

# Create requests from fake users to test user.
35.times do
	# Alternate between containing and not containing request message.
	if i.even?
		ConnectionRequest.create(profile_id: i, contact_id: test_user.id, request_message: message)
	else
		ConnectionRequest.create(profile_id: i, contact_id: test_user.id)
	end
	i += 1
end

# Faking user contacts
35.times do
	Connection.create(profile_id: test_user.id, contact_id: i)
	Connection.create(profile_id: i, contact_id: test_user.id)
	i += 1
end
