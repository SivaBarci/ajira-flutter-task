import 'dart:io';

import 'package:ajira_flutter_app/core/constants/layouts/layouts.dart';
import 'package:ajira_flutter_app/core/constants/routes/image_routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  ImageProvider profilePic = const AssetImage(
    profileIconUrl,
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        ImageSource? source = await showModalBottomSheet<ImageSource>(
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(kDefaultAllSidePadding),
            child: Column(
              children: [
                Text(
                  "Pick image from",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Row(
                  children: [
                    FilledButton(
                      onPressed: () =>
                          Navigator.of(context).pop(ImageSource.camera),
                      child: Image.asset(
                        cameraIconUrl,
                        scale: 5,
                      ),
                    ),
                    FilledButton(
                      onPressed: () =>
                          Navigator.of(context).pop(ImageSource.gallery),
                      child: Image.asset(
                        galleryIconUrl,
                        scale: 5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
        if (source != null) {
          final ImagePicker picker = ImagePicker();
          // Pick an image.
          final XFile? image = await picker.pickImage(
            source: source,
            maxHeight: 480,
            maxWidth: 640,
          );

          if (image != null) {
            final file = File(image.path);
            setState(() {
              profilePic = FileImage(
                file,
              );
            });
          }
        }
      },
      child: CircleAvatar(
        backgroundImage: const AssetImage(
          profileIconUrl,
        ),
        foregroundImage: profilePic,
      ),
    );
  }
}
