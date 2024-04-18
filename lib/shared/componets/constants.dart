import '../../modules/shop_app/login/shop_login_screen.dart';
import '../Network/local/cache_helper.dart';
import 'componets.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value)
  {
    if(value!)
    {
      navigateAndFinish(context, ShopLoginScreen());
    }
  });
}

void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

dynamic token ='';