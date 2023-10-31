part of '../reservation_screen.dart';

class CustomHeader extends StatelessWidget {
  final String? title;
  const CustomHeader({
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text(
          "Cancha $title",
          style: _theme.textTheme.headline1,
        ),
      ),
    );
  }
}
