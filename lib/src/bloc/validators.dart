import 'dart:async';

mixin Validators{
  final validaUser =
   StreamTransformer<String, String>
    .fromHandlers(
    handleData: (user, sink){
    if(user.length > 3){
      sink.add(user);
    }
    else{
      sink.addError('Usuario no valido:(.');
    }
  }
  );

  final validaPassword =
   StreamTransformer<String, String>
    .fromHandlers(
    handleData: (password, sink){
    if(password.length > 4){
      sink.add(password);
    }
    else{
      sink.addError('Contraseña no válida:(.');
    }
  }
  );
}