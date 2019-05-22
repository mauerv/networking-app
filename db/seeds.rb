require 'uri'

10.times do 
	user = User.create(
		email: FFaker::Internet.email,
		password: 'password',
		password_confirmation: 'password' 
	)
	user.profile.update(
		name: FFaker::Name.name,
		title: "#{FFaker::Job.title} at #{FFaker::Company.name}",
		country: FFaker::Address.country,
		description: FFaker::Lorem.paragraph
	)
	url = FFaker::Avatar.image
	filename = File.basename(URI.parse(url).path)
	file = URI.open(url)

	user.profile.image.attach(io: file, filename: filename)
end