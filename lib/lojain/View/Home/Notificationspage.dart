import 'package:MediLink/lojain/models/Notifications/getallnotfications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controllers/onboarding/SelectionLang.dart';
import '../../Controllers/onboarding/SelectionTheme.dart';
    
class Notificationspage extends StatelessWidget {

  const Notificationspage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    context.read<GetallnotficationsCubit>().fetchProfile();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromRGBO(38, 115, 221, 1),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 70, right: 70),
          child: Text(
            context.watch<Selection>().state == 1 ? 'الأشعارات' : 'Notifications',
            // style: TextStyle(color: Colors.white),
          ),
        ),
      ),
   
      body: BlocBuilder<GetallnotficationsCubit, GetallnotficationsState>(
        builder: (context, state) {
          if(state is GetallnotficationsLoading){
            return Center(
              child: CircularProgressIndicator(
                color:  context.watch<SelectionTheme>().state == 3
                  ? Colors.white
                  : Colors.black, 
              ),
            );
          }
         else if(state is GetallnotficationsLoaded) {return Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView.builder(
                itemCount: state.notifications['data'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color:state.notifications['data'][index]['read_at']==null? Colors.blue : Colors.transparent,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(state.notifications['data'][index]['title'],style: 
                                  TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 70.0),
                                  child: Text(state.notifications['data'][index]['created_at'],style: 
                                  TextStyle(fontWeight: FontWeight.w300,fontSize: 10),),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text( style: 
                            TextStyle(fontWeight: FontWeight.w300,fontSize: 12),"${state.notifications['data'][index]['body']} at ${state.notifications['data'][index]['data']['start_time']}-${state.notifications['data'][index]['data']['end_time']}"),
                                Text(style: 
                            TextStyle(fontWeight: FontWeight.w300,fontSize: 12),state.notifications['data'][index]['data']['message']),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,)
                        ,Divider(), 
                      ],
                    ),
                  ) ;
                },
      
              ),
            );
        }
        else return SizedBox();
        },
      ),
    );
  }
}