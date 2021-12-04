import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_app/cubit/cubit.dart';
import 'package:social_app/layout/social_app/cubit/states.dart';
import 'package:social_app/modules/social_app/new_post/new_post_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {
        if (state is SocialNewPostState) {
          navigateTo(context,  NewPostScreen());
        }
      },
      builder: (BuildContext context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(IconBroken.Notification),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(IconBroken.Search),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            currentIndex: cubit.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Home,
                ),
                label: 'Feeds',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Chat,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Paper_Upload,
                ),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Location,
                ),
                label: 'users',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Setting,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}

// verefication design
//ConditionalBuilder(
           // condition: SocialCubit.get(context).model != null,
           // builder: (BuildContext context) {
             // return Column(
                // ignore: prefer_const_literals_to_create_immutables
              //  children: [
                  //  emailverification design
                  // Container(
                  //     color: Colors.amber.withOpacity(0.6),
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //       child: Row(
                  //         children: [
                  //           const Icon(
                  //             Icons.info_outline,
                  //           ),
                  //           const SizedBox(
                  //             width: 15.0,
                  //           ),
                  //           const Expanded(
                  //             child: Text(
                  //               'please verify your email ',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 20.0,
                  //           ),
                  //           defaultTextButton(
                  //             function: () {
                  //               FirebaseAuth.instance.currentUser
                  //                   .sendEmailVerification()
                  //                   .then((value) {
                  //                 showToast(
                  //                   text: 'check your mail',
                  //                   state: ToastStates.SUCCESS,
                  //                 );
                  //               }).catchError((error) {});
                  //             },
                  //             text: 'send',
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
             //   ],
             // );
            //},
            //fallback: (context) =>
              //  const Center(child: CircularProgressIndicator()),
          //),
      
