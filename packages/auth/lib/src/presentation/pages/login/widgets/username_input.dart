part of login;

class LoginUsernameInput extends StatelessWidget {
  const LoginUsernameInput({
    Key? key,
    required this.focusNode,
  }) : super(key: key);
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, LoginInput>(
      selector: (state) {
        return state.loginInput;
      },
      builder: (context, state) {
        bool showErrorMessage = context.select(
          (LoginCubit bloc) => bloc.state.showErrorMessageUsername,
        );
        return DesignTextInput(
          hint: 'Username / Email / Phone No.',
          key: const Key('username input'),
          focusNode: focusNode,
          showHint: false,
          errorText: showErrorMessage ? state.error : null,
          alwaysShowLabel: true,
          initialText: '',
          onChanged: (value) {
            context.read<LoginCubit>().onChangeUsername(value ?? '');
          },
        );
      },
    );
  }
}
