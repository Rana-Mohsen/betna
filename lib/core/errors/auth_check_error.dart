
String checkError(Map<String, dynamic> respBody,) {
     if (respBody.containsKey("errors") && respBody["status"]=="error") {
      print(respBody);
      return"name or email already exists";
    }
    return"signed up successfully";

  }
  