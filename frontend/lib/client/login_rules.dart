bool emailIsValid(String email) {
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);
}

String snsPassword(String provider) => 'sns:$provider';

const signupSessionPrefix = 'signup:';

bool isSignupSession(String sessionID) => sessionID.startsWith(signupSessionPrefix);

String signupCodeFromSession(String sessionID) => sessionID.substring(signupSessionPrefix.length);
