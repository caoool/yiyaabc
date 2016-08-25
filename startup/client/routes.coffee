# Router.configure
#   layoutTemplate: 'blankLayout'
#   notFoundTemplate: 'notFound'

Router.onBeforeAction ->

  @subscribe('currentUser').wait()
  if @ready()
    if !Meteor.userId()
      @render 'login'
      return
    else
      @next()
      return
  @next()
  return

, except: [
  'register'
  'login'
]


Router.route '/', ->

	@render 'home'
	return


Router.route '/register', ->

	@render 'register'
	return


Router.route '/login', ->

  @render 'login'
  return