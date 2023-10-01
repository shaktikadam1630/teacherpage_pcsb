import 'dart:async';

import 'package:bloc/bloc.dart';
part 'contacts_page_event.dart';
part 'contacts_page_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<CardGmailNavigateEvent>(cardGmailNavigateEvent);
    on<CardGitNavigateEvent>(cardGitNavigateEvent);
    on<CardGLinkedinNavigateEvent>(cardGLinkedinNavigateEvent);
  }

  FutureOr<void> cardGmailNavigateEvent(CardGmailNavigateEvent event, Emitter<HomeBlocState> emit) {
    print('email');
    emit(HomeGmailPressedState());
  }

  FutureOr<void> cardGitNavigateEvent(CardGitNavigateEvent event, Emitter<HomeBlocState> emit) {
    print('github');
    emit(HomeGitPressedState());
  }

  FutureOr<void> cardGLinkedinNavigateEvent(CardGLinkedinNavigateEvent event, Emitter<HomeBlocState> emit) {
    print('linkedin');
    emit(HomeLinkedinPressedState());
  }
}

