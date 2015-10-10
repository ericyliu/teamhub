AuthService = ($firebaseAuth, $firebaseObject, FIREBASE_REF) ->
  auth = $firebaseAuth FIREBASE_REF

  Auth =
    createProfile: (profile) ->
      firebaseProfile = $firebaseObject FIREBASE_REF.child "/profiles/#{Auth.user.uid}"
      firebaseProfile.$value =
        username: profile.username
        phone: profile.phone
        first: profile.first
        last: profile.last
        email: Auth.user.password.email
      firebaseProfile.$save().then -> Auth.user.profile = firebaseProfile

    login: (user) -> auth.$authWithPassword user

    logout: -> auth.$unauth()

    register: (user) -> auth.$createUser user

    resolveUser: -> auth.$getAuth()

    signedIn: -> !!Auth.user?.provider

    user: {}

  auth.$onAuth (authData) ->
    angular.copy authData, Auth.user
    Auth.user.profile = $firebaseObject FIREBASE_REF.child "/profiles/#{authData.uid}" if authData

  Auth

AuthService.$inject = ['$firebaseAuth', '$firebaseObject', 'FIREBASE_REF']


module.exports = AuthService