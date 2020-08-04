import 'package:halopos/data/rest_ds.dart';
import 'package:halopos/models/account_model.dart';

abstract class updateProfileContract {
  void onUpdateSuccess(ResponseAccount user);
  void onUpdateError(String msg);
}

class updateProfilePresenter {
  updateProfileContract _view;
  RestDatasource api = new RestDatasource();

  updateProfilePresenter(this._view);

  doUpdate(Account request) {
    api.update(request).then((ResponseAccount response) {
      if (response.status) {
        _view.onUpdateSuccess(response);
      } else {
        _view.onUpdateError('Pastikan yang anda masukan benar benar!');
      }
    }).catchError((error) => _view.onUpdateError(error.toString()));
  }
}