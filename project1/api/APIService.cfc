component {

    // Dış API'den veri çeken fonksiyon
    public any function getPostsFromAPI() {
        // API URL
        var apiUrl = "https://dummyjson.com/posts";
        var apiData = {};

        try {
            // API'dan veri çekme
            apiData = this.fetchDataFromAPI(apiUrl);
        } catch (any e) {
            // Hata durumunda işlem
            apiData = { error = "API'den veri çekilemedi. Hata: #e.message#" };
        }

        return apiData;
    }

    // Dış API'den veri çeken yardımcı fonksiyon
    private any function fetchDataFromAPI(required string apiUrl) {
        var result = {};

        try {
            // API isteği gönderme
            var apiResponse = new Http(
                method = "GET",
                url = apiUrl
            ).send().getPrefix();

            // Eğer istek başarılıysa
            if (apiResponse.statusCode eq 200) {
                // JSON verisini çözümleme
                result = deserializeJSON(apiResponse.fileContent);
            } else {
                // Eğer başarısızsa hata durumu oluştur
                result = { error = "API'den veri alınamadı. StatusCode: #apiResponse.statusCode#" };
            }
        } catch (any e) {
            // Hata durumunda işlem
            result = { error = "API isteği sırasında bir hata oluştu: #e.message#" };
        }

        return result;
    }
}
