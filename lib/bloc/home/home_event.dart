import 'package:equatable/equatable.dart';

//created on 30/09/2021
//purpose : to manage SearchVendorInitialise press event
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SearchProductInitialise extends HomeEvent {
  final String searchText;

  const SearchProductInitialise({required this.searchText});

  @override
  List<Object> get props => [searchText];

  @override
  String toString() => 'SearchVendorInitialise { searchText: $searchText }';
}

class GetProductDetailsInit extends HomeEvent {
  final String id;

  const GetProductDetailsInit({required this.id});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'SearchVendorInitialise { searchText: $id }';
}
