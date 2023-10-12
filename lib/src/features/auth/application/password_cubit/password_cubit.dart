import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'password_cubit.freezed.dart';
part 'password_state.dart';

@injectable
class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordState.initial());
}

List<Map> passwordRules = [
  {
    'name': '1 capital letter',
    'rule': (String text) => RegExp("(?=.*[A-Z])").hasMatch(text)
  },
  {
    'name': '1 number',
    'rule': (String text) => RegExp("(?=.*[0-9])").hasMatch(text)
  },
  {
    'name': '1 special character',
    'rule': (String text) => RegExp("(?=.*[@#\$%^&+=!])").hasMatch(text)
  },
  {
    'name': 'At least 8 characters',
    'rule': (String text) => RegExp(".{8,}").hasMatch(text)
  },
];
