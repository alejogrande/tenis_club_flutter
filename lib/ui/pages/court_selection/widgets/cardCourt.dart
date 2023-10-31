part of "../court_selection_screen.dart";

class CardCourt extends StatelessWidget {
  final Court court;
  final Function()? onTap;
  final bool? selected;

  const CardCourt({
    required this.court,
    required this.onTap,
    required this.selected,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Container(
        width: 230,
        height: 150,
        margin: const EdgeInsets.only(bottom: Const.space15),
        padding: const EdgeInsets.all(Const.space8),
        decoration: BoxDecoration(
      
          border: Border.all(
            color: AppColors.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(Const.radius),
          color: selected!=true?theme.cardColor:AppColors.disabledButton,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(Const.radius),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 12, right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Const.radius),
                  child: Image.asset(
                    court.image,
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: Const.space12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cancha ${court.name}",
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.displaySmall,
                      ),
                      RichText(
                        text: TextSpan(
                          style: theme.textTheme.titleMedium
                              ?.copyWith(color: AppColors.fontTitle),
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Tipo: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: court.details),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: theme.textTheme.titleSmall
                              ?.copyWith(color: AppColors.fontTitle),
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Dimensión: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: court.size),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
