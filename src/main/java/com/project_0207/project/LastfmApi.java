// import org.apache.http.client.HttpClient;
// import org.apache.http.client.methods.HttpGet;
// import org.apache.http.impl.client.HttpClientBuilder;
// import com.fasterxml.jackson.databind.ObjectMapper;

// public class LastfmApi {
//     private static final String API_KEY = "YOUR_API_KEY_HERE";
//     private static final String BASE_URL = "http://ws.audioscrobbler.com/2.0/";

//     public static void main(String[] args) throws Exception {
//         String artist = "Radiohead";
//         String method = "artist.getInfo";

//         String url = String.format("%s?method=%s&artist=%s&api_key=%s&format=json", BASE_URL, method, artist, API_KEY);

//         HttpClient client = HttpClientBuilder.create().build();
//         HttpGet request = new HttpGet(url);

//         ObjectMapper mapper = new ObjectMapper();
//         String response = client.execute(request, response -> {
//             int status = response.getStatusLine().getStatusCode();
//             if (status >= 200 && status < 300) {
//                 return response.getEntity().getContent();
//             } else {
//                 throw new RuntimeException("Unexpected HTTP status code: " + status);
//             }
//         });

//         ArtistInfo artistInfo = mapper.readValue(response, ArtistInfo.class);
//         System.out.println(artistInfo.getName());
//     }

//     static class ArtistInfo {
//         private String name;
//         // add any other fields you want to parse from the JSON response
//         // using Jackson annotations
//         // e.g. @JsonProperty("image")
//         //      private List<Image> images;
//         //      ...
//         public String getName() {
//             return name;
//         }
//         public void setName(String name) {
//             this.name = name;
//         }
//     }
// }
