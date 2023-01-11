abstract class LoginStates{}
class InitialLoginState extends LoginStates{}

class ChangeEyePassword extends LoginStates{}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginFailureState extends LoginStates {}