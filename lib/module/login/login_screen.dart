import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:server_api/layout/cubit/cubit.dart';
import 'package:server_api/layout/cubit/states.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var PINContriller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServerAPICubit, ServerAPIStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ServerAPICubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Login'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(

            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(width: 3),
                            )),
                            value: cubit.dropDownSelectedValue,
                            items: cubit.dropDownItems
                                .map((item) => DropdownMenuItem(
                                      child: Text(item!),
                                      value: item,
                                    ))
                                .toList(),
                            onChanged: (value) {
                              cubit.chooseDropDownItem(value);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                        controller: PINContriller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.pin),
                            border: OutlineInputBorder(),

                            labelText: 'PIN',
                            hintText: 'Enter The PIN Of Your Card'),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Required';
                          }
                        },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                       cubit.login(context,cubit.generateMd5(PINContriller.text));
                        } else {
                          print("Not Validated");
                        }
                      },
                      color: Colors.blue,
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      minWidth: double.infinity,
                      splashColor: Colors.amber,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  cubit.loginLoading?const Center(child: CircularProgressIndicator(),):const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
