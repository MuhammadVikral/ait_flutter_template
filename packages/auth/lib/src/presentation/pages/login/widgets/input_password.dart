part of login;

class LoginPasswordInput extends StatelessWidget {
  const LoginPasswordInput({
    Key? key,
    required this.focusNode,
  }) : super(key: key);
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, PasswordInput>(
      selector: (state) {
        return state.passwordInput;
      },
      builder: (context, state) {
        bool showErrorMessage = context
            .select((LoginCubit bloc) => bloc.state.showErrorMessagePassword);
        return DesignTextInput(
          key: const Key('password input'),
          hint: 'Password',
          focusNode: focusNode,
          errorText: showErrorMessage ? state.error : null,
          showHint: false,
          suffixLabel: DesignText.body2('Forgot Password?')
              .bold
              .overideColor(DesignColors.primaryBase),
          suffixIcon: const Icon(Icons.remove_red_eye),
          alwaysShowLabel: true,
          initialText: '',
          onChanged: (value) =>
              context.read<LoginCubit>().onChangePassword(value ?? ''),
        );
      },
    );
  }
}
