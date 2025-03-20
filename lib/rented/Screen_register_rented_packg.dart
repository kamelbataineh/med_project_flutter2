import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:med_project_flutter2/rented/Screen_login_rented.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
return name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ECORP',
      logo: const AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUser,
      onSignup: _signupUser,

      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: () async {
            debugPrint('start google sign in');
            await Future.delayed(loginTime);
            debugPrint('stop google sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebookF,
          label: 'Facebook',
          callback: () async {
            debugPrint('start facebook sign in');
            await Future.delayed(loginTime);
            debugPrint('stop facebook sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.linkedinIn,
          callback: () async {
            debugPrint('start linkdin sign in');
            await Future.delayed(loginTime);
            debugPrint('stop linkdin sign in');
            return null;

          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.githubAlt,
          callback: () async {
            debugPrint('start github sign in');
            await Future.delayed(loginTime);
            debugPrint('stop github sign in');
            return null;
          },
        ),
      ],
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ScreenLoginRented(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}


// bool isPasswordVisible = true;
// bool isPasswordVisibleConfirm = true;
// String? select;
//
// ///////////////////////////////////////////////////////////////////////////////
//
// final _formkey = GlobalKey<FormState>();
// int? phone;
// String? business_Name;
// String? email;
// String? password;
//
// ///////////////////////////////////////////////////////////////////////////////
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     drawerEnableOpenDragGesture: false,
//     appBar: AppBar(
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back),
//         onPressed: () {
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(
//               builder: (context) => Userorrented(),
//             ),
//           );
//         },
//       ),
//       title: Align(
//         alignment: Alignment.centerRight,
//         child: Text('تسجيل'),
//       ),
//       backgroundColor: Color(0xFF15b9b4),
//     ),
//     body: SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Form(
//         key: _formkey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context)
//                           .popAndPushNamed(route_ScreenRegisterRented);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF15b9b4),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Text(
//                       'حساب جديد',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context)
//                           .pushNamed(route_ScreenLoginRented);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey[300],
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Text(
//                       'تسجيل دخول',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pushNamed(route_ScreenCitiesUser);
//                 },
//                 child: Text(
//                   "دخول دون تسجيل",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//
//             Lottie.network(
//               "https://lottie.host/84ad8c2d-1bdd-4b4a-ba71-16243f26c7c5/zNoEoKMJy6.json",
//               width: 100,
//               height: 100,
//               fit: BoxFit.none,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ///////////////
//             buildTextField(
//               'الاسم التجاري',
//               Icons.home,
//               false,
//                   (value) {
//                 business_Name = value;
//               },
//             ),
//             buildTextField('البريد الإلكتروني', Icons.email, true, (value) {
//               email = value;
//             }),
//             buildTextField("Phone", Icons.phone, true, (value) {
//               if (value != null && value.isNotEmpty) {
//                 if (value.length <= 10) {
//                   phone = int.tryParse(value);
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(
//                           "رقم الهاتف يجب أن يحتوي على 10 أرقام أو أقل."),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
//                 }
//               }
//             }),
//             buildPasswordField("كلمة السر", isPasswordVisible, () {
//               setState(() {
//                 isPasswordVisible = !isPasswordVisible;
//               });
//             }),
//             // buildPasswordField("تأكيد كلمة السر", isPasswordVisibleConfirm, () {
//             //   setState(() {
//             //     isPasswordVisibleConfirm = !isPasswordVisibleConfirm;
//             //   });
//             // }),
//
//             //////////////
//             SizedBox(height: 10),
//
//             ElevatedButton(
//               onPressed: () {
//                 if (_formkey.currentState!.validate()) {
//                   _formkey.currentState!.save();
//                   signup();
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF15b9b4),
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: Text('حساب جديد',
//                   style: TextStyle(fontSize: 18, color: Colors.black)),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }














