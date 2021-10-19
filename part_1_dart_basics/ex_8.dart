class User {
  String email;

  User(this.email);
}

mixin getMailSystem on User {
  String get mailSystem => email.split("@")[1];
}

class AdminUser extends User with getMailSystem {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

class UserManager<T extends User> {
  List<T> users = [];

  void add(T user) {
    this.users.add(user);
  }

  void remove(T user) {
    this.users.remove(user);
  }

  void getUsers<L extends AdminUser>() {
    this.users.forEach((element) {
      if (element.runtimeType == AdminUser) {
        AdminUser temp = element as AdminUser;
        print('${temp.mailSystem}');
      } else {
        print('${element.email}');
      }
    });
  }
}

void main() {
  User test = User('qwe@test.com');
  AdminUser admin = AdminUser('admin@flutter.com');
  GeneralUser user1 = GeneralUser('user1@flutter.com');
  GeneralUser user2 = GeneralUser('user2@flutter.com');
  GeneralUser user3 = GeneralUser('user3@flutter.com');
  admin.mailSystem;

  UserManager userManager = UserManager();

  userManager.add(admin);
  userManager.add(user1);
  userManager.add(user2);
  userManager.add(user3);

  userManager.getUsers();

  userManager.remove(user2);

  userManager.getUsers();
}
