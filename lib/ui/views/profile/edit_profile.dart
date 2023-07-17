import 'package:flutter/material.dart';
import 'package:pat_e/common/constants/app_constant.dart';
import 'package:pat_e/core/models/users_model.dart';
import 'package:pat_e/core/services/authentication_service.dart';
import 'package:pat_e/core/services/users_service.dart';
import 'package:pat_e/core/utils/themes/color.dart';
import 'package:pat_e/ui/components/custom_text_input.dart';
import 'package:pat_e/ui/components/customappbar.dart';

class EditProfilePage extends StatefulWidget {
  final Users user;

  EditProfilePage({required this.user});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.user.username;
    _emailController.text = widget.user.email;
    _passwordController.text = widget.user.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.deepPurpleAccent, //quaternaryColor.withOpacity(0.4),
      appBar: const CustomAppBar(
          showBackButton: true, pageTitle: AppConstant.editProfileTitle),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 12.0),
            CustomTextInput(
              textEditController: _usernameController,
              hintTextString: 'Adınızı soyadınızı giriniz',
              inputType: InputType.Default,
              enableBorder: true,
              cornerRadius: 10.0,
              maxLength: 24,
              errorMessage: '',
              labelText: 'Ad Soyad',
              prefixIcon: const Icon(Icons.near_me, color: bgColor),
              textColor: bgColor,
              themeColor: bgColor,
            ),
            SizedBox(height: 12.0),
            CustomTextInput(
              textEditController: _emailController,
              hintTextString: 'E-posta adresinizi giriniz',
              inputType: InputType.Email,
              enableBorder: true,
              cornerRadius: 10.0,
              maxLength: 24,
              errorMessage: '',
              labelText: 'E-posta adresi',
              prefixIcon: const Icon(Icons.email, color: bgColor),
              textColor: bgColor,
              themeColor: bgColor,
            ),
            SizedBox(height: 12.0),
            CustomTextInput(
              textEditController: _passwordController,
              hintTextString: 'Şifrenizi giriniz',
              inputType: InputType.Password,
              enableBorder: true,
              cornerRadius: 10.0,
              maxLength: 24,
              errorMessage: '',
              labelText: 'Şifre',
              prefixIcon: const Icon(Icons.lock, color: bgColor),
              textColor: bgColor,
              themeColor: bgColor,
            ),
            SizedBox(height: 5.0),
            Container(
              margin: const EdgeInsets.all(16),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: TextButton(
                onPressed: () {
                  _updateProfile();
                },
                child: const Text(
                  'Güncelle',
                  style: TextStyle(
                    color: mainAuxiliaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            /*
            ElevatedButton(
              onPressed: () {
                _updateProfile();
              },
              child: Text('Kaydet'),
            ),
            */
          ],
        ),
      ),
    );
  }

  void _updateProfile() {
    String newUsername = _usernameController.text.trim();
    String newEmail = _emailController.text.trim();
    String newPassword = _passwordController.text.trim();

    Users updatedUser = Users(
      userID: widget.user.userID,
      username: newUsername,
      email: newEmail,
      password: newPassword,
      profilePhoto: widget.user.profilePhoto,
    );

    AuthenticationService()
        .updateUserInformation(
            newEmail: newEmail,
            newPassword: newPassword,
            newUsername: newUsername)
        .then((_) {
      // Kullanıcının güncellenmiş profilini Profile sayfasında göstermek için geri dön
      Navigator.pop(context, updatedUser);
    }).catchError((error) {
      // Hata durumunda kullanıcıya bir hata mesajı göster
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text('Profil güncellenirken bir hata oluştu.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    });
  }
}
