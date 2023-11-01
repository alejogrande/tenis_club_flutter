part of "../home_screen.dart";

class CardBooking extends StatelessWidget {
  final HomeBooking booking;
  final Function()? onTap;

  const CardBooking({
    required this.booking,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Container(
        width: 230,
        height: 200,
        margin: const EdgeInsets.only(bottom: Const.space15),
        padding: const EdgeInsets.all(Const.space8),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(Const.radius),
          color: theme.cardColor,
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 35, bottom: 20, left: 12, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Const.radius),
                    child: Image.asset(
                      booking.court!.image,
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
                          "Cancha ${booking.court!.name}",
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.displaySmall,
                        ),
                        Text(booking.name!, overflow: TextOverflow.ellipsis),
                        TextAndTitle(title: "Tipo", text: booking.court!.details),
                         TextAndTitle(title: "Dimensión", text: booking.court!.size),
                       
                        TextAndTitle(title: "fecha", text: "${booking.date!.year}-${booking.date!.month}-${booking.date!.day}"),
                        
                        TextAndTitle(title: "Hora", text: booking.hour!.details),
                        
                        Row(
                          children: [
                            TextAndTitle(title: "Clima", text: '${booking.grade}°C'),
                            SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.network("${booking.icon}")),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                top: 1,
                right: 1,
                child: PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: 'eliminar',
                        child: Text('Eliminar'),
                      ),
                      
                    ];
                  },
                  onSelected: (value) {
                    if (value == 'eliminar') {
                       onTap!();
                    }
                  },
                  icon: const Icon(Icons.more_vert,color: AppColors.primary,), // Icono de tres puntos verticales
                ),
              ),
          ],
        ),
      ),
    );
  }
}


