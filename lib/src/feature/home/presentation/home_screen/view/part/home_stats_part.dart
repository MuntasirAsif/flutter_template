part of '../home_screen.dart';

class HomeStatsPart extends StatelessWidget {
  const HomeStatsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.padding.p12.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.color.onPrimary,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: context.color.primary.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          
          10.verticalSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _$StatsElement(
                  title: 'Emotional',
                  value: '5/10',
                  icon: Assets.icons.spiritual.path,
                  color: context.color.accent.blue,
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: _$StatsElement(
                  title: 'Mental',
                  value: '5/10',
                  icon: Assets.icons.mental.path,
                  color: context.color.accent.purple,
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _$StatsElement(
                  title: 'Physical',
                  value: '5/10',
                  icon: Assets.icons.physical.path,
                  color: context.color.accent.yellow,
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: _$StatsElement(
                  title: 'Emotional',
                  value: '5/10',
                  icon: Assets.icons.heartOutline.path,
                  color: context.color.primary,
                ),
              ),
            ],
          ),
          20.verticalSpace,
          FilledButton(
            onPressed: () {
            },
            child: Text('See Daily Checklist'),
          ),
        ],
      ),
    );
  }
}

class _$StatsElement extends StatelessWidget {
  const _$StatsElement({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.padding.p12.r),
      decoration: BoxDecoration(
        color: context.color.disabled.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: context.color.disabled),
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.2),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: SvgPicture.asset(
                icon,
                height: 20.h,
                width: 20.w,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    style: context.textStyle.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    value,
                    style: context.textStyle.bodySmall.copyWith(
                      color: context.color.text.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fade(duration: 500.ms).slideY(duration: 500.ms);
  }
}
