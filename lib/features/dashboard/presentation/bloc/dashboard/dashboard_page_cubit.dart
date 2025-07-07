import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'dashboard_page_state.dart';

@injectable
class DashboardPageCubit extends Cubit<int> {
  DashboardPageCubit() : super(0);

  void changeNav(int index) => emit(index);
}
