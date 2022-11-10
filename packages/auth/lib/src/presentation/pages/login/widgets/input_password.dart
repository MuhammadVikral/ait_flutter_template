part of login;

class LoginPasswordInput extends StatelessWidget {
  const LoginPasswordInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthCubit, AuthState, PasswordInput>(
      selector: (state) {
        return state.passwordInput;
      },
      builder: (context, state) {
        return DesignTextInput(
          key: const Key('password input'),
          hint: 'Password',
          errorText: state.error,
          showHint: false,
          suffixLabel: DesignText.body2('Forgot Password?')
              .bold
              .overideColor(DesignColors.primaryBase),
          suffixIcon: const Icon(Icons.remove_red_eye),
          alwaysShowLabel: true,
          initialText: '',
          onChanged: (value) =>
              context.read<AuthCubit>().onChangePassword(value ?? ''),
        );
      },
    );
  }
}
