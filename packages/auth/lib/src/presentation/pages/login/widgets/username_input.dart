part of login;

class LoginUsernameInput extends StatelessWidget {
  const LoginUsernameInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState, LoginInput>(
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
            context.read<AuthCubit>().onChangeLogin(value ?? '');
          },
        );
      },
    );
  }
}
