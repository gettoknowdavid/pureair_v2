import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/constants/constants.dart';

part 'password_cubit.freezed.dart';
part 'password_state.dart';

@injectable
class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordState.initial());
}
