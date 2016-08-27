Meteor.methods


	'roles.addToRole': (userId, role) ->

		new SimpleSchema
			userId: type: String
			role:
				type: String
				allowedValues: [
					'student'
					'teacher'
					'admin'
				]
		.validate
			userId: userId
			role: role

		Roles.addUsersToRoles userId, [role]