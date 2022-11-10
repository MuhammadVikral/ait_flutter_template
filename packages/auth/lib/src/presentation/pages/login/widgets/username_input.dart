part of login;

class LoginUsernameInput extends StatelessWidget {
  const LoginUsernameInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, LoginInput>(
      selector: (state) {
        return state.loginInput;
      },
      builder: (context, state) {
        return DesignTextInput(
          hint: 'Username / Email / Phone No.',
          showHint: false,
          alwaysShowLabel: true,
          initialText: '',
          onChanged: (value) {
            context.read<LoginCubit>().onChangeLogin(value ?? '');
          },
        );
      },
    );
  }
}
