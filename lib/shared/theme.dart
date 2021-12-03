part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = Color(0xff503E9D);
Color accentColor1 = Color(0xff2C1F63);
Color accentColor2 = Color(0xFFFBD460);
Color accentColor3 = Color(0xffADADAD);

const MaterialColor accentColor = const MaterialColor(
  0xFFFBD460,
  const <int, Color>{
  50: const Color(0xFFFBD460),
    100: const Color(0xFFFBD460),
    200: const Color(0xFFFBD460),
    300: const Color(0xFFFBD460),
    400: const Color(0xFFFBD460),
    500: const Color(0xFFFBD460),
    600: const Color(0xFFFBD460),
    700: const Color(0xFFFBD460),
    800: const Color(0xFFFBD460),
    900: const Color(0xFFFBD460),
  },
);

TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle purpleTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);

TextStyle whiteNumberFont = GoogleFonts.openSans()
    .copyWith(color: Colors.white);
TextStyle yellowNumberFont = GoogleFonts.openSans()
    .copyWith(color: accentColor2);






