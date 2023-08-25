import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class TextOptionBtn extends StatelessWidget {
  final String name;
  final VoidCallback? onPressed;
  const TextOptionBtn({Key? key, required this.name, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return name.text.xl2.bold.heightLoose.lime300.center
        .textStyle(GoogleFonts.getFont('Play'))
        .extraBold
        .makeCentered()
        .p12()
        .onInkTap(onPressed != null
            ? () async {
                await HapticFeedback.heavyImpact();
                onPressed?.call();
              }
            : null);
  }
}
