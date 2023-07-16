import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/common/constants/path_constant.dart';
import 'package:pat_e/core/models/users_model.dart';
import 'package:pat_e/core/services/users_service.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/ui/components/customappbar.dart';
import 'package:pat_e/ui/components/sidemenu.dart';
import 'package:photo_view/photo_view.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? profilePhotoUrl;
  String? name;
  String? email;
  bool isImageFullScreen = false;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    Users? user = await UsersService().getUser();

    if (user != null) {
      setState(() {
        profilePhotoUrl = user.profilePhoto;
        name = user.username;
        email = user.email;
      });
    }
  }

  void showFullScreenImage(BuildContext context) {
    setState(() {
      isImageFullScreen = true;
    });

    showDialog(
      context: context,
      builder: (_) => Container(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isImageFullScreen = false;
            });
            Navigator.of(context).pop(); // Dialog'ı kapat
          },
          child: PhotoView(
            imageProvider: profilePhotoUrl != null
                ? NetworkImage(profilePhotoUrl!)
                : AssetImage(PathConstant.noImage) as ImageProvider<Object>?,
            backgroundDecoration: BoxDecoration(
              color: Colors.transparent,
            ),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
          ),
        ),
      ),
    );
  }

  Future<void> updateProfilePhoto() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Users? user = await UsersService().getUser();
      if (user != null) {
        Users updatedUser = Users(
          userID: user.userID,
          username: user.username,
          email: user.email,
          password: user.password,
          profilePhoto: user.profilePhoto,
        );

        await UsersService()
            .updateUser(updatedUser, File(image.path))
            .then((_) {
          if (mounted) {
            setState(() {
              profilePhotoUrl = updatedUser.profilePhoto;
            });
          }
        }).catchError((error) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Hata'),
                content: const Text(
                    'Profil fotoğrafı değiştirilirken bir hata oluştu.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Tamam'),
                  ),
                ],
              );
            },
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      drawer: const SideMenu(),
      appBar: const CustomAppBar(
        showBackButton: false,
        pageTitle: AppConstant.profileTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                setState(() {
                  isImageFullScreen = true;
                });
                showFullScreenImage(context);
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: profilePhotoUrl != null
                        ? NetworkImage(profilePhotoUrl!)
                        : AssetImage(PathConstant.noImage)
                            as ImageProvider<Object>?,
                    backgroundColor: primaryColor,
                  ),
                  Positioned(
                    bottom: 2,
                    left: 75,
                    right: 0,
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: bgColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            updateProfilePhoto();
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            itemProfile('Adı Soyadı', name ?? '', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Email', email ?? '', CupertinoIcons.mail),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: secondaryColor,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text('DÜZENLE'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: secondaryColor,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text('HESABIMI SİL'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: primaryColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(
          iconData,
          color: primaryColor,
        ),
        trailing: const Icon(Icons.arrow_forward, color: primaryColor),
        tileColor: secondaryColor,
      ),
    );
  }
}
