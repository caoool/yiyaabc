Users = {}

Users.profileSchema = new SimpleSchema
  # organizationId:
  #   type: String
  #   max: 50

Users.Schema = new SimpleSchema

  profile:

    type: Users.profileSchema
    optional: true


  username:

    type: String
    min: 6
    max: 20
    optional: true


  emails:

    type: Array
    optional: true


  "emails.$":

    type: Object


  "emails.$.address":

    type: String
    regEx: SimpleSchema.RegEx.Email


  "emails.$.verified":

    type: Boolean


  createdAt:

    type: Date


  services:

    type: Object
    optional: true
    blackbox: true


  roles:

    type: Array
    optional: true


  'roles.$':

    type: String
    

Meteor.users.attachSchema Users.Schema
