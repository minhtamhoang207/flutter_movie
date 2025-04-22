import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable
{
  const MovieEvent();

  @override
  List<Object> get props => [];
}


class FetchMovies extends MovieEvent{}

class NavigationEvent extends Equatable
{
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationChanged extends NavigationEvent
{
  final int index;
   const NavigationChanged(this.index);

   @override
  List<Object> get props => [index];

}