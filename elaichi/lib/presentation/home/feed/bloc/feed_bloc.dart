import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/domain/models/mm_article/mm_article.dart';
import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_bloc.freezed.dart';
part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc({
    required UserRepository userRepository,
    required EventRepository eventRepository,
  })  : _userRepository = userRepository,
        _eventRepository = eventRepository,
        super(const _Loading()) {
    on<FeedEvent>(
      (event, emit) async {
        await event.when(
          started: () async {
            final status = getZimraLoginStatus();
            final articles = await _eventRepository.fetchMMArticles();
            articles.fold(
              (exception) => _articles = [],
              (articles) => _articles = articles,
            );
            emit(
              FeedState.initial(
                webMailState: status
                    ? WebMailState.authenticated
                    : WebMailState.unAuthenticated,
                articles: _articles,
              ),
            );
          },
        );
      },
    );
  }

  late final UserRepository _userRepository;
  late final EventRepository _eventRepository;
  late final List<MMArticle> _articles;

  bool getZimraLoginStatus() {
    if (_userRepository.rollNumber != null) {
      return true;
    } else {
      return false;
    }
  }
}
