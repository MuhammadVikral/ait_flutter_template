part of login;

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) {
        return state.buttonEnabled;
      },
      builder: (context, state) {
        FormzStatus status =
            context.select((LoginCubit bloc) => bloc.state.formStatus);
        return DesignButton(
          key: const Key('login button'),
          onTap: () {
            context.read<LoginCubit>().onTappedButon();
          },
          isLoading: status == FormzStatus.submissionInProgress,
          height: 40,
          enabled: state,
          child: DesignText.body1('Login').bold.overideColor(
                DesignColors.white,
              ),
        );
      },
    );
  }
}
