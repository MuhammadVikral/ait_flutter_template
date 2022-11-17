part of login;

class LoginDialogError extends StatelessWidget {
  const LoginDialogError({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignDialog(
      image: const DesignImage(AImage.exclamation),
      title: 'Oops..',
      body: 'Username / Email / Phone No. is not yet registered. Register now?',
      negativeButtonTitle: 'Back',
      positiveButtonTitle: 'Register',
      onNegative: () {},
      onPositive: () {},
    );
  }
}
