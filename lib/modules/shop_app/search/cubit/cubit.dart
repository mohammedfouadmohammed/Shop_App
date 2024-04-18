import 'package:first_app/models/shop_app/search_model.dart';
import 'package:first_app/modules/shop_app/search/cubit/states.dart';
import 'package:first_app/shared/Network/end_point.dart';
import 'package:first_app/shared/Network/remote/dio_helper.dart';
import 'package:first_app/shared/componets/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates>
{
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;
  void search (String text)
  {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      token: token,
      data:
      {
        'text': text,
      },
    ).then((value) {

      model = SearchModel.fromJson(value?.data);

      emit(SearchSuccessState());

    }).catchError((error) {

      print(error.toString());

      emit(SearchErrorState());
    });
  }
  }