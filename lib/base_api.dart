abstract class BaseApi {
  String apiServer = "http://ostest.whitetigersoft.ru/api/";
  String apiKey = "phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF";

  getApiUrl(relativePath, categoryId) {
    if (categoryId != null) {
      var apiUrl = apiServer + relativePath + "?appKey=" + apiKey + "&categoryId=" + categoryId;
      return apiUrl;
    } else {
      var apiUrl = apiServer + relativePath + "?appKey=" + apiKey;
      return apiUrl;
    }
  }
}