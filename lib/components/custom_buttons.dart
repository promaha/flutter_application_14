import 'package:flutter/material.dart';
import 'package:flutter_application_14/constants.dart';
import 'package:easy_loading_button/easy_loading_button.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData iconData;

  const DefaultButton(
      {super.key,
      required this.onPress,
      required this.title,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
        ),
        padding: const EdgeInsets.only(right: kDefaultPadding),
        width: 450.0,
        height: 60.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [kSecondaryColor, kPrimaryColor],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: kTextWhiteColor,
                  ),
            ),
            const Spacer(),
            Icon(
              iconData,
              size: 30.0,
              color: kTextWhiteColor,
            )
          ],
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  const SmallButton({super.key, required this.onPress, required this.title});
  final VoidCallback onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
        ),
        padding: const EdgeInsets.only(right: kDefaultPadding),
        width: 120.0,
        height: 60.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [kSecondaryColor, kPrimaryColor],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                      color: kTextWhiteColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//زر الانتقال بين الدروس
class MoveButton extends StatelessWidget {
  const MoveButton({super.key, required this.onPress, required this.icon});
  final VoidCallback onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
        ),
        padding: const EdgeInsets.only(right: kDefaultPadding),
        width: 120.0,
        height: 60.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [kSecondaryColor, kPrimaryColor],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//زر الاختيار  في الاختبار
class TestButton extends StatelessWidget {
  const TestButton({super.key, required this.onPress, required this.text});
  final VoidCallback onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
        ),
        padding: const EdgeInsets.only(right: kDefaultPadding),
        width: 120.0,
        height: 60.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [kSecondaryColor, kPrimaryColor],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

TextField textField(String title, TextEditingController controller) {
  //TextEditingController _controller = TextEditingController();

  return TextField(
    obscureText: false,
    textAlign: TextAlign.left,
    keyboardType: TextInputType.visiblePassword,
    controller: controller,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 17.0,
      fontWeight: FontWeight.w300,
    ),
    decoration: InputDecoration(
      labelText: title,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      isDense: true,
    ),
  );
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {super.key,
      required this.title,
      required this.value,
      required this.iconProfile});
  final String title;
  final String value;
  final IconData iconProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Divider(
                  thickness: 1.0,
                ),
              )
            ],
          ),
          Icon(
            iconProfile,
            size: 20.0,
          )
        ],
      ),
    );
  }
}

class EasyLoadButton extends StatelessWidget {
  const EasyLoadButton({super.key, required this.title, required this.onPress});

  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return EasyButton(
      type: EasyButtonType.elevated,

      // Content inside the button when the button state is idle.
      idleStateWidget: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),

      // Content inside of the button when the button state is loading.
      loadingStateWidget: const CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
      ),

      // Whether or not to animate the width of the button. Default is `true`.
      // If this is set to `false`, you might want to set the `useEqualLoadingStateWidgetDimension` parameter to `true`.
      useWidthAnimation: true,

      // Whether or not to force the `loadingStateWidget` to have equal dimension. Default is `true`.
      // This is useful when you are using `CircularProgressIndicator` as the `loadingStateWidget`.
      // This parameter might also be useful when you set the `useWidthAnimation` parameter to `true` combined with `CircularProgressIndicator` as the value for `loadingStateWidget`.
      useEqualLoadingStateWidgetDimension: true,

      // If you want a fullwidth size, set this to double.infinity
      width: 150.0,

      height: 40.0,
      borderRadius: 4.0,

      // The elevation of the button.
      // This will only be applied when the type parameter value is EasyButtonType.elevated
      elevation: 0.0,

      // The gap between button and it's content.
      // This will be ignored when the `type` parameter value is set to `EasyButtonType.text`
      contentGap: 6.0,

      // Color for the button.
      // For [EasyButtonType.elevated]: This will be the background color.
      // For [EasyButtonType.outlined]: This will be the border color.
      // For [EasyButtonType.text]: This will be the text color.
      buttonColor: kPrimaryColor,

      onPressed: onPress,
    );
  }
}
