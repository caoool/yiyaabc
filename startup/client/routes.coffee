# Router.configure
#   layoutTemplate: 'blankLayout'
#   notFoundTemplate: 'notFound'

Router.onBeforeAction ->

  @subscribe('currentUser').wait()

  if @ready() and !Meteor.userId()
    Router.go '/login'
    return
  @next()
  return

, except: [
  'register'
  'login'
]


Router.route '/', ->

  if Roles.userIsInRole Meteor.user(), ['student']
    @render 'student'
    return

  if Roles.userIsInRole Meteor.user(), ['teacher']
    @render 'teacher'
    return

  @render 'home'
	return


Router.route '/register', ->

	@render 'register'
	return


Router.route '/login', ->

  @render 'login'
  return