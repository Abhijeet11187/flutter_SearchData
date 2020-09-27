class JsonData{
 final String countryName;
 final String stateName;
 final String cityName;

 JsonData({
   this.countryName,
   this.stateName,
   this.cityName
 });

 factory JsonData.fromJson(Map<String,String>json){
   return JsonData(
     countryName: json['countryName'],
     stateName: json['stateName'],
     cityName: json['cityName']
   );
 }

}