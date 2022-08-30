import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class Skeletons {
  static SkeletonListView skeletonListView = SkeletonListView(
    item: SkeletonListTile(
      verticalSpacing: 12,
      leadingStyle: const SkeletonAvatarStyle(
          width: 64, height: 64, shape: BoxShape.circle),
      titleStyle: SkeletonLineStyle(
          height: 16,
          minLength: 200,
          randomLength: true,
          borderRadius: BorderRadius.circular(12)),
      subtitleStyle: SkeletonLineStyle(
          height: 12,
          maxLength: 200,
          randomLength: true,
          borderRadius: BorderRadius.circular(12)),
      hasSubtitle: true,
    ),
  );

  static SkeletonParagraph skeletonParagraph = SkeletonParagraph(
      style: SkeletonParagraphStyle(
          lines: 4,
          lineStyle: SkeletonLineStyle(
              randomLength: true, borderRadius: BorderRadius.circular(12))));

  static SkeletonAvatar skeletonAvatar = SkeletonAvatar(
    style: SkeletonAvatarStyle(
        width: 64, height: 64, shape: BoxShape.circle, borderRadius: BorderRadius.circular(12)),
  );

  static SkeletonItem skeletonItem = SkeletonItem(
    child: SkeletonListTile(
      verticalSpacing: 12,
      leadingStyle: const SkeletonAvatarStyle(
          width: 64, height: 64, shape: BoxShape.circle),
      titleStyle: SkeletonLineStyle(
          height: 16,
          minLength: 200,
          randomLength: true,
          borderRadius: BorderRadius.circular(12)),
      subtitleStyle: SkeletonLineStyle(
          height: 12,
          maxLength: 200,
          randomLength: true,
          borderRadius: BorderRadius.circular(12)),
      hasSubtitle: true,
    ),
  );
}
