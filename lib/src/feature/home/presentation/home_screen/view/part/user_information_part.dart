part of '../home_screen.dart';

class UserInformationPart extends StatelessWidget {
  const UserInformationPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomNetworkImage(
          imageUrl:
              "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg",
          height: 40.h,
          width: 40.w,
          radius: 100.r,
        ),
        10.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Alex", style: context.textStyle.headingSmall),
            Text(
              "Good Morning",
              style: context.textStyle.bodySmall.copyWith(
                color: context.color.text.secondary,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: context.color.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: SvgPicture.asset(
              Assets.icons.notification.path,
              colorFilter: ColorFilter.mode(
                context.color.primary,
                BlendMode.srcIn,
              ),
            ).animate().shake(duration: 500.ms),
          ),
        ),
      ],
    );
  }
}
