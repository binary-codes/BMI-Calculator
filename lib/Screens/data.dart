//import 'package:flutter/material.dart';


class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Choose your gender, male or female.");
  sliderModel.setTitle("Select");
  sliderModel.setImageAssetPath("assets/gender.gif");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Ajdust your height in centimeter.");
  sliderModel.setTitle("Adjust");
  sliderModel.setImageAssetPath("assets/hgt.gif");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Select your weight in kilogram and age");
  sliderModel.setTitle("Choose");
  sliderModel.setImageAssetPath("assets/age.gif");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}