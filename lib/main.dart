import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializamos Firebase con manejo de errores
  try {
    await Firebase.initializeApp();
    print("Firebase inicializado correctamente.");
  } catch (e) {
    print("Error al inicializar Firebase: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Auth CBDX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isLoading = false;
  String? userName;
  String? userEmail;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();

    // Escuchar el estado de autenticación
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          userName = user.displayName;
          userEmail = user.email;
          isLoggedIn = true;
        });
      } else {
        setState(() {
          userName = null;
          userEmail = null;
          isLoggedIn = false;
        });
      }
    });
  }

  Future<void> signInWithGoogle() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Iniciar sesión con Google
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount == null) {
        // Si el usuario cancela el inicio de sesión
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Inicio de sesión cancelado por el usuario')),
        );
        setState(() {
          isLoading = false;
        });
        return;
      }

      // Obtener el token de autenticación de Google
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      // Usar el token para crear las credenciales de Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Autenticar a Firebase con las credenciales de Google
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        setState(() {
          userName = user.displayName;
          userEmail = user.email;
          isLoggedIn = true;
        });
      }
    } catch (error) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> signOut() async {
    try {
      // Cerrar sesión de Firebase y Google
      await _auth.signOut();
      await _googleSignIn.signOut();
      setState(() {
        userName = null;
        userEmail = null;
        isLoggedIn = false;
      });
    } catch (error) {
      print("Error al cerrar sesión: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cerrar sesión: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Auth CBDX'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!isLoggedIn) ...[
                    ElevatedButton(
                      onPressed: signInWithGoogle,
                      child: Text('Iniciar sesión con Google'),
                    ),
                  ],
                  if (isLoggedIn) ...[
                    Text(
                      '¡Bienvenido, $userName!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Email: $userEmail',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: signOut,
                      child: Text('Cerrar sesión'),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}
