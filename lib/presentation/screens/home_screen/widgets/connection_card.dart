import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:slbfe_client/data/models/connection_user.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../data/models/connection_user.dart';

class ConnectionCard extends StatefulWidget {
  final ConnectionUser connectionUser;
  const ConnectionCard({
    Key? key,
    required this.connectionUser,
  }) : super(key: key);

  @override
  State<ConnectionCard> createState() => _ConnectionCardState();
}

class _ConnectionCardState extends State<ConnectionCard> {
  ConnectionUser get connectionUser => widget.connectionUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: AppColors.lightElv0,
          child: Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              children: [Text(connectionUser.name)],
            ),
          ),
        )
      ],
    );
  }
}
