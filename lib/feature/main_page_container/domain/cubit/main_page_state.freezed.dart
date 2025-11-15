// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainPageState {

 int get page;
/// Create a copy of MainPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainPageStateCopyWith<MainPageState> get copyWith => _$MainPageStateCopyWithImpl<MainPageState>(this as MainPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainPageState&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'MainPageState(page: $page)';
}


}

/// @nodoc
abstract mixin class $MainPageStateCopyWith<$Res>  {
  factory $MainPageStateCopyWith(MainPageState value, $Res Function(MainPageState) _then) = _$MainPageStateCopyWithImpl;
@useResult
$Res call({
 int page
});




}
/// @nodoc
class _$MainPageStateCopyWithImpl<$Res>
    implements $MainPageStateCopyWith<$Res> {
  _$MainPageStateCopyWithImpl(this._self, this._then);

  final MainPageState _self;
  final $Res Function(MainPageState) _then;

/// Create a copy of MainPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MainPageState].
extension MainPageStatePatterns on MainPageState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MainPageStateInitial value)?  initial,TResult Function( MainPageStateLoading value)?  loading,TResult Function( MainPageStateReady value)?  ready,TResult Function( MainPageStateSuccess value)?  success,TResult Function( MainPageStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MainPageStateInitial() when initial != null:
return initial(_that);case MainPageStateLoading() when loading != null:
return loading(_that);case MainPageStateReady() when ready != null:
return ready(_that);case MainPageStateSuccess() when success != null:
return success(_that);case MainPageStateError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MainPageStateInitial value)  initial,required TResult Function( MainPageStateLoading value)  loading,required TResult Function( MainPageStateReady value)  ready,required TResult Function( MainPageStateSuccess value)  success,required TResult Function( MainPageStateError value)  error,}){
final _that = this;
switch (_that) {
case MainPageStateInitial():
return initial(_that);case MainPageStateLoading():
return loading(_that);case MainPageStateReady():
return ready(_that);case MainPageStateSuccess():
return success(_that);case MainPageStateError():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MainPageStateInitial value)?  initial,TResult? Function( MainPageStateLoading value)?  loading,TResult? Function( MainPageStateReady value)?  ready,TResult? Function( MainPageStateSuccess value)?  success,TResult? Function( MainPageStateError value)?  error,}){
final _that = this;
switch (_that) {
case MainPageStateInitial() when initial != null:
return initial(_that);case MainPageStateLoading() when loading != null:
return loading(_that);case MainPageStateReady() when ready != null:
return ready(_that);case MainPageStateSuccess() when success != null:
return success(_that);case MainPageStateError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int page)?  initial,TResult Function( int page)?  loading,TResult Function( int page)?  ready,TResult Function( int page)?  success,TResult Function( String message,  int page)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MainPageStateInitial() when initial != null:
return initial(_that.page);case MainPageStateLoading() when loading != null:
return loading(_that.page);case MainPageStateReady() when ready != null:
return ready(_that.page);case MainPageStateSuccess() when success != null:
return success(_that.page);case MainPageStateError() when error != null:
return error(_that.message,_that.page);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int page)  initial,required TResult Function( int page)  loading,required TResult Function( int page)  ready,required TResult Function( int page)  success,required TResult Function( String message,  int page)  error,}) {final _that = this;
switch (_that) {
case MainPageStateInitial():
return initial(_that.page);case MainPageStateLoading():
return loading(_that.page);case MainPageStateReady():
return ready(_that.page);case MainPageStateSuccess():
return success(_that.page);case MainPageStateError():
return error(_that.message,_that.page);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int page)?  initial,TResult? Function( int page)?  loading,TResult? Function( int page)?  ready,TResult? Function( int page)?  success,TResult? Function( String message,  int page)?  error,}) {final _that = this;
switch (_that) {
case MainPageStateInitial() when initial != null:
return initial(_that.page);case MainPageStateLoading() when loading != null:
return loading(_that.page);case MainPageStateReady() when ready != null:
return ready(_that.page);case MainPageStateSuccess() when success != null:
return success(_that.page);case MainPageStateError() when error != null:
return error(_that.message,_that.page);case _:
  return null;

}
}

}

/// @nodoc


class MainPageStateInitial implements MainPageState {
  const MainPageStateInitial({required this.page});
  

@override final  int page;

/// Create a copy of MainPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainPageStateInitialCopyWith<MainPageStateInitial> get copyWith => _$MainPageStateInitialCopyWithImpl<MainPageStateInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainPageStateInitial&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'MainPageState.initial(page: $page)';
}


}

/// @nodoc
abstract mixin class $MainPageStateInitialCopyWith<$Res> implements $MainPageStateCopyWith<$Res> {
  factory $MainPageStateInitialCopyWith(MainPageStateInitial value, $Res Function(MainPageStateInitial) _then) = _$MainPageStateInitialCopyWithImpl;
@override @useResult
$Res call({
 int page
});




}
/// @nodoc
class _$MainPageStateInitialCopyWithImpl<$Res>
    implements $MainPageStateInitialCopyWith<$Res> {
  _$MainPageStateInitialCopyWithImpl(this._self, this._then);

  final MainPageStateInitial _self;
  final $Res Function(MainPageStateInitial) _then;

/// Create a copy of MainPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(MainPageStateInitial(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MainPageStateLoading implements MainPageState {
  const MainPageStateLoading({required this.page});
  

@override final  int page;

/// Create a copy of MainPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainPageStateLoadingCopyWith<MainPageStateLoading> get copyWith => _$MainPageStateLoadingCopyWithImpl<MainPageStateLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainPageStateLoading&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'MainPageState.loading(page: $page)';
}


}

/// @nodoc
abstract mixin class $MainPageStateLoadingCopyWith<$Res> implements $MainPageStateCopyWith<$Res> {
  factory $MainPageStateLoadingCopyWith(MainPageStateLoading value, $Res Function(MainPageStateLoading) _then) = _$MainPageStateLoadingCopyWithImpl;
@override @useResult
$Res call({
 int page
});




}
/// @nodoc
class _$MainPageStateLoadingCopyWithImpl<$Res>
    implements $MainPageStateLoadingCopyWith<$Res> {
  _$MainPageStateLoadingCopyWithImpl(this._self, this._then);

  final MainPageStateLoading _self;
  final $Res Function(MainPageStateLoading) _then;

/// Create a copy of MainPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(MainPageStateLoading(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MainPageStateReady implements MainPageState {
  const MainPageStateReady({required this.page});
  

@override final  int page;

/// Create a copy of MainPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainPageStateReadyCopyWith<MainPageStateReady> get copyWith => _$MainPageStateReadyCopyWithImpl<MainPageStateReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainPageStateReady&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'MainPageState.ready(page: $page)';
}


}

/// @nodoc
abstract mixin class $MainPageStateReadyCopyWith<$Res> implements $MainPageStateCopyWith<$Res> {
  factory $MainPageStateReadyCopyWith(MainPageStateReady value, $Res Function(MainPageStateReady) _then) = _$MainPageStateReadyCopyWithImpl;
@override @useResult
$Res call({
 int page
});




}
/// @nodoc
class _$MainPageStateReadyCopyWithImpl<$Res>
    implements $MainPageStateReadyCopyWith<$Res> {
  _$MainPageStateReadyCopyWithImpl(this._self, this._then);

  final MainPageStateReady _self;
  final $Res Function(MainPageStateReady) _then;

/// Create a copy of MainPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(MainPageStateReady(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MainPageStateSuccess implements MainPageState {
  const MainPageStateSuccess({required this.page});
  

@override final  int page;

/// Create a copy of MainPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainPageStateSuccessCopyWith<MainPageStateSuccess> get copyWith => _$MainPageStateSuccessCopyWithImpl<MainPageStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainPageStateSuccess&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'MainPageState.success(page: $page)';
}


}

/// @nodoc
abstract mixin class $MainPageStateSuccessCopyWith<$Res> implements $MainPageStateCopyWith<$Res> {
  factory $MainPageStateSuccessCopyWith(MainPageStateSuccess value, $Res Function(MainPageStateSuccess) _then) = _$MainPageStateSuccessCopyWithImpl;
@override @useResult
$Res call({
 int page
});




}
/// @nodoc
class _$MainPageStateSuccessCopyWithImpl<$Res>
    implements $MainPageStateSuccessCopyWith<$Res> {
  _$MainPageStateSuccessCopyWithImpl(this._self, this._then);

  final MainPageStateSuccess _self;
  final $Res Function(MainPageStateSuccess) _then;

/// Create a copy of MainPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(MainPageStateSuccess(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MainPageStateError implements MainPageState {
  const MainPageStateError({required this.message, required this.page});
  

 final  String message;
@override final  int page;

/// Create a copy of MainPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainPageStateErrorCopyWith<MainPageStateError> get copyWith => _$MainPageStateErrorCopyWithImpl<MainPageStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainPageStateError&&(identical(other.message, message) || other.message == message)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,message,page);

@override
String toString() {
  return 'MainPageState.error(message: $message, page: $page)';
}


}

/// @nodoc
abstract mixin class $MainPageStateErrorCopyWith<$Res> implements $MainPageStateCopyWith<$Res> {
  factory $MainPageStateErrorCopyWith(MainPageStateError value, $Res Function(MainPageStateError) _then) = _$MainPageStateErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, int page
});




}
/// @nodoc
class _$MainPageStateErrorCopyWithImpl<$Res>
    implements $MainPageStateErrorCopyWith<$Res> {
  _$MainPageStateErrorCopyWithImpl(this._self, this._then);

  final MainPageStateError _self;
  final $Res Function(MainPageStateError) _then;

/// Create a copy of MainPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? page = null,}) {
  return _then(MainPageStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
