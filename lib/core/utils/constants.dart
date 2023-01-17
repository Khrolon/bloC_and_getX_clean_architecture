import 'package:poc/data/models/user_model.dart';

String apiUrlForGetTokenByGoogleLogin =
    "https://cpd1.mitraecp.com:4028/mitraspace/login";

String apiUrlForCreateUserByGoogleLogin =
    "https://cpd1.mitraecp.com:4028/mitraspace/user/googleUser";

String apiUrlForGetToken =
    "https://cpd1.mitraecp.com:4028/mitraspace/auth/login";

String apiUrlForGetUserData =
    "https://cpd1.mitraecp.com:4028/mitraspace/user/logged";

late UserModel globalUserLogged;
