import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/providers/auth_provider.dart';
import 'package:groceries_app/screens/auth/login_screens.dart';
import 'package:groceries_app/widgets/navigator.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String,String>> setting = [
    {'icon' : "assets/icons/order.svg",'name' : 'Orders'},
    {'icon' : "assets/icons/my_detail.svg",'name' : 'My Detail'},
    {'icon' : "assets/icons/location.svg",'name' : 'Delivery Address'},
    {'icon' : "assets/icons/payment.svg",'name' : 'Payment Methods'},
    {'icon' : "assets/icons/cord.svg",'name' : 'Promo Cord'},
    {'icon' : "assets/icons/ring.svg",'name' : 'Notifecations'},
    {'icon' : "assets/icons/help.svg",'name' : 'Help'},
    {'icon' : "assets/icons/about.svg",'name' : 'About'},

  ];

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviders>(context);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 69,
              ),
              Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/user.jpg'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Hoàng The QUyen',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'quyenquyen0028@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.subtextColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30,),
              Expanded(child: SizedBox(
                width:  double.infinity,
                child: ListView.builder(padding: EdgeInsets.all(0),itemCount: setting.length,itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){},
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 0.5,
                          color: AppColors.subtextColor,
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            IconButton(onPressed: (){}, icon: SvgPicture.asset(setting[index]['icon']!),),
                            SizedBox(width: 10,),
                            Text(setting[index]['name']!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.textColor),)
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          height: 0.5,
                          color: AppColors.subtextColor,
                        ),
                      ],
                    ),
                  );
                }),
              ),),
        SizedBox(
          width: double.infinity,
          height: 67,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF2F3F2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),),
            onPressed: ()async{
              await authProvider.signOut();
              NavigationHelper.navigateTo(context, LoginScreens());
            },
            child: const Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.logout_outlined,color: AppColors.primaryColor,),
                SizedBox(width: 90,),
                Text(
                    "Log Out",
                    style:TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
            ],
          ),
        ),
    );
  }
}
