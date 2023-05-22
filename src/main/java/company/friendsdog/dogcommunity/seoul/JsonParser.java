package company.friendsdog.dogcommunity.seoul;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonSyntaxException;

import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.FileWriter;
import java.io.IOException;

public class JsonParser {

  public static void main(String[] args) {
    String filePath = "src/main/resources/static/JSON/seoul.json";

    try {
      Gson gson = new Gson();

      FeatureCollection featureCollection = gson.fromJson(new FileReader(filePath), FeatureCollection.class);

      for (Feature feature : featureCollection.getFeatures()) {
        List<List<List<Double>>> coordinates = feature.getGeometry().getCoordinates();
        for (List<List<Double>> coordinate : coordinates) {
          for (List<Double> point : coordinate) {
            Double temp = point.get(0);
            point.set(0, point.get(1));
            point.set(1, temp);
          }
        }
      }
      FileWriter fileWriter = new FileWriter(filePath);
      gson.toJson(featureCollection, fileWriter);
      fileWriter.close();


    } catch (JsonSyntaxException | JsonIOException | IOException e) {
      e.printStackTrace();
    }
  }
}