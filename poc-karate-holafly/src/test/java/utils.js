function fn() {
  var utils = {
    generateRandomEmail: function () {
      var timestamp = new Date().getTime();
      return "test" + timestamp + "@example.com";
    },
    generateRandomPhone: function () {
      var number = Math.floor(Math.random() * 9000000000) + 1000000000;
      return number.toString();
    },
  };
  return utils;
}
