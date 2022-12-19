import 'package:server_api/shared/network/local/cache_helper.dart';

const PING = 'ping';
const LOGIN = 'login';
const CARDQUOTA = 'get-card-quota';
const DATA_FROM_USER = 'data-from-user';

List<String>  IPSANDPORTS = CacheHelper.getData(key: 'ipAndPorts');