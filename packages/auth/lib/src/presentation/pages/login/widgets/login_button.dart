part of login;

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, LoginInput>(
      selector: (state) {
        return state.loginInput;
      },
      builder: (context, state) {
        return DesignButton(
          onTap: () {},
          height: 40,
          enabled: state.valid,
          child: DesignText.body1('Login').bold.overideColor(
                DesignColors.white,
              ),
        );
      },
    );
  }
}
