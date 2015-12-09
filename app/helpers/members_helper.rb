module MembersHelper

	# Returns the gravatar for the given user.
	def gravatar_for(member)
		gravatar_id = Digest::MD5::hexdigest(member.member_email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, alt:member.member_name, class: "gravatar img-circle")
	end
end
