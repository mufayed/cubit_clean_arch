
import '../data/models/entries/entries_response.dart';
import '../data/repositories/entries_repo.dart';
import '../di/locator.dart';
import '../utils/network_status.dart';
import 'base_provider.dart';

class HomeProvider extends BaseProvider {
  late EntriesResponse entriesResponse;

  getEntries() async {
    await Future.delayed(const Duration(seconds: 3));
    changeNetworkStatus(NETWORK_STATUS.LOADING);
    await Future.delayed(const Duration(seconds: 3));

    locator.get<EntriesRepository>().getEntries().then((value) => {
          value.when(success: (response) {
            entriesResponse = response;
            changeNetworkStatus(NETWORK_STATUS.SUCCESS);
          }, failure: (error) {
            networkError = error;
            changeNetworkStatus(NETWORK_STATUS.ERROR);
          })
        });
  }
}
