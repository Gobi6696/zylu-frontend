// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import '../providers/auth_provider.dart';
// // import 'signup_screen.dart';
// //
// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({super.key});
// //
// //   @override
// //   State<LoginScreen> createState() => _LoginScreenState();
// // }
// //
// // class _LoginScreenState extends State<LoginScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _emailController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //
// //   bool _isLoading = false;
// //   String? _error;
// //
// //   @override
// //   void dispose() {
// //     _emailController.dispose();
// //     _passwordController.dispose();
// //     super.dispose();
// //   }
// //
// //   Future<void> _login() async {
// //     if (!_formKey.currentState!.validate()) return;
// //
// //     setState(() => _isLoading = true);
// //     _error = null;
// //
// //     final auth = Provider.of<AuthProvider>(context, listen: false);
// //     final error = await auth.login(
// //       _emailController.text.trim(),
// //       _passwordController.text.trim(),
// //     );
// //
// //     setState(() => _isLoading = false);
// //
// //     if (error != null && mounted) {
// //       setState(() => _error = error);
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text(error), backgroundColor: Colors.red),
// //       );
// //     }
// //     // else → provider will notify → splash logic already handles redirect
// //   }
// //
// //   Future<void> _googleSignIn() async {
// //     setState(() => _isLoading = true);
// //     final auth = Provider.of<AuthProvider>(context, listen: false);
// //     final error = await auth.loginWithGoogle();
// //
// //     setState(() => _isLoading = false);
// //
// //     if (error != null && mounted) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text(error), backgroundColor: Colors.red),
// //       );
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Padding(
// //           padding: const EdgeInsets.all(24.0),
// //           child: Form(
// //             key: _formKey,
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: [
// //                 const Icon(
// //                   Icons.lock_person_rounded,
// //                   size: 80,
// //                   color: Color(0xFF6750A4),
// //                 ),
// //                 const SizedBox(height: 32),
// //                 const Text(
// //                   "Welcome Back",
// //                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
// //                   textAlign: TextAlign.center,
// //                 ),
// //                 const SizedBox(height: 48),
// //
// //                 TextFormField(
// //                   controller: _emailController,
// //                   keyboardType: TextInputType.emailAddress,
// //                   decoration: const InputDecoration(
// //                     labelText: 'Email',
// //                     prefixIcon: Icon(Icons.email_outlined),
// //                     border: OutlineInputBorder(),
// //                   ),
// //                   validator: (v) {
// //                     if (v == null || v.isEmpty) return 'Email is required';
// //                     if (!v.contains('@')) return 'Invalid email';
// //                     return null;
// //                   },
// //                 ),
// //                 const SizedBox(height: 16),
// //
// //                 TextFormField(
// //                   controller: _passwordController,
// //                   obscureText: true,
// //                   decoration: const InputDecoration(
// //                     labelText: 'Password',
// //                     prefixIcon: Icon(Icons.lock_outline),
// //                     border: OutlineInputBorder(),
// //                   ),
// //                   validator: (v) {
// //                     if (v == null || v.isEmpty) return 'Password is required';
// //                     if (v.length < 6) return 'Minimum 6 characters';
// //                     return null;
// //                   },
// //                 ),
// //                 const SizedBox(height: 24),
// //
// //                 if (_error != null) ...[
// //                   Text(_error!, style: const TextStyle(color: Colors.red)),
// //                   const SizedBox(height: 8),
// //                 ],
// //
// //                 ElevatedButton(
// //                   onPressed: _isLoading ? null : _login,
// //                   style: ElevatedButton.styleFrom(
// //                     padding: const EdgeInsets.symmetric(vertical: 16),
// //                     backgroundColor: const Color(0xFF6750A4),
// //                   ),
// //                   child: _isLoading
// //                       ? const CircularProgressIndicator(color: Colors.white)
// //                       : const Text(
// //                           'Login',
// //                           style: TextStyle(fontSize: 18, color: Colors.white),
// //                         ),
// //                 ),
// //                 const SizedBox(height: 16),
// //
// //                 OutlinedButton.icon(
// //                   onPressed: _isLoading ? null : _googleSignIn,
// //                   icon: const Icon(Icons.g_mobiledata_rounded),
// //                   label: const Text('Continue with Google'),
// //                   style: OutlinedButton.styleFrom(
// //                     padding: const EdgeInsets.symmetric(vertical: 16),
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 32),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     const Text("Don't have an account? "),
// //                     TextButton(
// //                       onPressed: () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (_) => const SignupScreen(),
// //                           ),
// //                         );
// //                       },
// //                       child: const Text('Sign Up'),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/auth_provider.dart';
// import 'signup_screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   bool _isLoading = false;
//   String? _errorMessage;
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _login() async {
//     if (!_formKey.currentState!.validate()) return;
//
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });
//
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     final error = await authProvider.login(
//       _emailController.text.trim(),
//       _passwordController.text.trim(),
//     );
//
//     if (!mounted) return;
//
//     setState(() => _isLoading = false);
//
//     if (error != null) {
//       setState(() => _errorMessage = error);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(error),
//           backgroundColor: Colors.red,
//           duration: const Duration(seconds: 4),
//         ),
//       );
//     }
//     // If no error → AuthProvider will notify listeners → splash / auth listener redirects
//   }
//
//   Future<void> _googleSignIn() async {
//     setState(() => _isLoading = true);
//
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     final error = await authProvider.loginWithGoogle();
//
//     if (!mounted) return;
//
//     setState(() => _isLoading = false);
//
//     if (error != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(error), backgroundColor: Colors.red),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 24.0,
//               vertical: 32.0,
//             ),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Logo / Icon
//                   const Icon(
//                     Icons.lock_person_rounded,
//                     size: 80,
//                     color: Color(0xFF6750A4),
//                   ),
//                   const SizedBox(height: 24),
//
//                   // Title
//                   const Text(
//                     "Welcome Back",
//                     style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     "Sign in to continue",
//                     style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 48),
//
//                   // Email field
//                   TextFormField(
//                     controller: _emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     textInputAction: TextInputAction.next,
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       prefixIcon: const Icon(Icons.email_outlined),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       filled: true,
//                       fillColor: Colors.grey[50],
//                     ),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       if (!value.contains('@') || !value.contains('.')) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),
//
//                   // Password field
//                   TextFormField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     textInputAction: TextInputAction.done,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       prefixIcon: const Icon(Icons.lock_outline),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       filled: true,
//                       fillColor: Colors.grey[50],
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       if (value.length < 6) {
//                         return 'Password must be at least 6 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 24),
//
//                   // Error message
//                   if (_errorMessage != null) ...[
//                     Text(
//                       _errorMessage!,
//                       style: const TextStyle(color: Colors.red, fontSize: 14),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 16),
//                   ],
//
//                   // Login button
//                   ElevatedButton(
//                     onPressed: _isLoading ? null : _login,
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       backgroundColor: const Color(0xFF6750A4),
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 2,
//                     ),
//                     child: _isLoading
//                         ? const SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: CircularProgressIndicator(
//                               color: Colors.white,
//                               strokeWidth: 2.5,
//                             ),
//                           )
//                         : const Text('Login', style: TextStyle(fontSize: 18)),
//                   ),
//                   const SizedBox(height: 20),
//
//                   // Google button
//                   OutlinedButton.icon(
//                     onPressed: _isLoading ? null : _googleSignIn,
//                     icon: const Icon(Icons.g_mobiledata_rounded, size: 28),
//                     label: const Text(
//                       'Continue with Google',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       side: const BorderSide(color: Colors.grey),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 40),
//
//                   // Sign up link
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Don't have an account? ",
//                         style: TextStyle(color: Colors.grey[700]),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const SignupScreen(),
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           'Sign Up',
//                           style: TextStyle(
//                             color: Color(0xFF6750A4),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   // Extra space for keyboard
//                   SizedBox(
//                     height: MediaQuery.of(context).viewInsets.bottom + 20,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _error;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    _error = null;

    final auth = Provider.of<AuthProvider>(context, listen: false);
    final error = await auth.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (error != null && mounted) {
      setState(() => _error = error);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error), backgroundColor: Colors.red),
      );
    }
    // Provider will notify listeners → auth state changes → navigation happens
  }

  Future<void> _googleSignIn() async {
    setState(() => _isLoading = true);
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final error = await auth.loginWithGoogle();

    setState(() => _isLoading = false);

    if (error != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Important: allows the view to resize when keyboard appears
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Center(
            child: SingleChildScrollView(
              // Helps dismiss keyboard when scrolling / tapping outside fields
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),

                    const Icon(
                      Icons.lock_person_rounded,
                      size: 80,
                      color: Color(0xFF6750A4),
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),

                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'Email is required';
                        }
                        if (!v.contains('@') || !v.contains('.')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'Password is required';
                        }
                        if (v.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    if (_error != null) ...[
                      Text(
                        _error!,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                    ],

                    ElevatedButton(
                      onPressed: _isLoading ? null : _login,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color(0xFF6750A4),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          : const Text('Login', style: TextStyle(fontSize: 18)),
                    ),
                    const SizedBox(height: 20),

                    OutlinedButton.icon(
                      onPressed: _isLoading ? null : _googleSignIn,
                      icon: const Icon(Icons.g_mobiledata_rounded, size: 28),
                      label: const Text('Continue with Google'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6750A4),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20), // extra bottom padding
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
