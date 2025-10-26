part of 'profiel_image_cubit.dart';

sealed class ProfielImageState extends Equatable {
  const ProfielImageState();

  @override
  List<Object> get props => [];
}

final class ProfielImageInitial extends ProfielImageState {}

class ProfileImageLoading extends ProfielImageState {}

class ProfileImageSuccess extends ProfielImageState {
  final String imageUrl;

  const ProfileImageSuccess(this.imageUrl);

  @override
  List<Object> get props => [imageUrl];
}

class ProfileImageFailure extends ProfielImageState {
  final String errMessage;

  const ProfileImageFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
