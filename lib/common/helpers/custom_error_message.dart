class CustomErrorMessage {
  static String getForgotPasswordErrorMessage(String errorCode) {
    switch (errorCode) {
      case "user-not-found":
        return "Bu bilgilere sahip bir kullanıcı kaydı yok.";
      case "invalid-email":
        return "Geçersiz email adresi.";
      default:
        return "Bir hata oluştu.";
    }
  }

  static String getRegisterErrorMessage(String errorCode) {
    switch (errorCode) {
      case "invalid-email":
        return "Geçersiz email adresi.";
      case "email-already-in-use":
        return "Belirtilen e-posta adresine sahip bir hesap zaten var.";
      case "weak-password":
        return "Belirlemiş olduğunuz parola yeterince güçlü değil.";
      case "invalid-password":
        return "Parola geçersiz. En az altı karakterden oluşan bir dize olmalıdır.";
      default:
        return "Bir hata oluştu.";
    }
  }

  static String getLoginErrorMessage(String errorCode) {
    switch (errorCode) {
      case "user-not-found":
        return "Bu bilgilere sahip bir kullanıcı kaydı yok.";
      case "invalid-email":
        return "Geçersiz email adresi.";
      case "wrong-password":
        return "Şifre yanlış veya geçersiz.";
      default:
        return "Bir hata oluştu.";
    }
  }

  static String getUpdateUserErrorMessage(String errorCode) {
    switch (errorCode) {
      case "invalid-email":
        return "Geçersiz email adresi.";
      case "weak-password":
        return "Belirlemiş olduğunuz parola yeterince güçlü değil.";
      case "invalid-password":
        return "Parola geçersiz. En az altı karakterden oluşan bir dize olmalıdır.";
      default:
        return "Bir hata oluştu.";
    }
  }
}
