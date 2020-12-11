import 'package:flutter/material.dart';

@immutable
abstract class MainState {}

class InitialState extends MainState {
  @override
  String toString() => 'InitialState';
}

class WalletScreenState extends MainState {
  @override
  String toString() => 'WalletScreenState';
}

class ExchangeScreenState extends MainState {
  @override
  String toString() => 'ExchangeScreenState';
}

class ConversionScreenState extends MainState {
  @override
  String toString() => 'ConversionScreenState';
}

class LoadingState extends MainState {
  @override
  String toString() => 'LoadingState';
}
