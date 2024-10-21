import 'dart:math';

// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:either_dart/either.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:com.morepos.morewin/presentation/widgets/custom_snackbar.dart';
import 'package:com.morepos.morewin/app/util/video_player_data_manager.dart';
import 'package:com.morepos.morewin/domain/entities/unsplash_image.dart';
// import 'package:com.morepos.morewin/domain/entities/unsplash_image_urls.dart';
import 'package:com.morepos.morewin/domain/entities/unsplash_search_response.dart';
// import 'package:com.morepos.morewin/domain/usecases/fetch_person_images_use_case.dart';
// import 'package:tuple/tuple.dart';
import 'package:video_player/video_player.dart';

import '../../data/models/mngdata/QryTables.dart';
import '../../data/models/mngdata/prFormula.dart';
import '../../data/models/promoion_model.dart';
import '../../data/repositories/mngdb_repository_impl.dart';
import '../../domain/entities/promo_details.dart';
import '../widgets/dropdown_search.dart';

class OrderController extends GetxController with GetTickerProviderStateMixin {
  OrderController();
  // AboutController();
  RxBool helloSeen = false.obs;
  RxBool nameSeen = false.obs;
  RxBool positionSeen = false.obs;
  RxBool abstractSeen = false.obs;
  RxBool showName = false.obs;
  RxBool showPosition = false.obs;
  RxBool showAbstract = false.obs;
  RxBool showHireMe = false.obs;
  RxBool hovered = false.obs;

  late int itemSize;
  late int itemsInEachRow;
  late int visibleRowsCount;

  // late FetchPersonImagesUseCase _fetchPersonImagesUseCase;
  // int _currentPage = Random().nextInt(5);
  // int _pageSize = 100;
  var unsplashSearchResponse = Rx<UnsplashSearchResponse?>(null);
  var images = RxList<UnsplashImage>([]);
  // var _isLoadMore = false;
  ScrollController scrollController = ScrollController();

  late FlickManager flickManager;
  late VideoPlayerDataManager? dataManager;
  final dropDownAprodKeySearch = GlobalKey<DropdownSearchState<PrQryTables>>();
  @override
  void onInit() {
    super.onInit();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(
            "https://youtu.be/vZgj0Y3TiI4?si=e-aNAmavsHPmNdy4"),
        autoPlay: false);

    dataManager = VideoPlayerDataManager(
        flickManager: flickManager,
        urls: ["https://youtu.be/vZgj0Y3TiI4?si=e-aNAmavsHPmNdy4"]);
  }

  @override
  void onReady() {
    if (Get.width < 768)
      itemSize = 64;
    else
      itemSize = 200;
    itemsInEachRow = (Get.width / itemSize).floor();
    visibleRowsCount = (Get.height / itemSize).floor();

    // fetchPersonImages();
    scrollController.addListener(_scrollListener);

    super.onReady();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    flickManager.dispose();
    super.dispose();
  }

  // fetchPersonImages() async {
  //   Either response = await _fetchPersonImagesUseCase
  //       .execute(Tuple2(_currentPage, _pageSize));
  //   response.fold((left) {
  //     CustomSnackBar.show(Get.context!, left.message, ContentType.failure);
  //   }, (right) {
  //     UnsplashSearchResponse newResponse = right;
  //     List<UnsplashImage>? temp = newResponse.results;
  //     images.assignAll(temp!);
  //     unsplashSearchResponse.value = newResponse;
  //     addMyPhoto();
  //     checkScreenFilledWithImages();
  //   });
  // }

  checkScreenFilledWithImages() {
    if (images.length < visibleRowsCount * itemsInEachRow) {
      // loadMore();
    }
  }
  final totalRepo = MngdbRepositoryIml();
  Future<List<PrFormula>> getPrFormulaSku(String filter) async {
    List<PrFormula> result = [];
    result = await totalRepo.getPrForrmulaBySku(filter);
    return result;
  }
  // loadMore() async {
  //   final totalResults = unsplashSearchResponse.value?.total ?? 0;
  //   if (totalResults / _pageSize <= _currentPage) return;
  //   if (_isLoadMore) return;
  //   _isLoadMore = true;

  //   Either newResponse = await _fetchPersonImagesUseCase
  //       .execute(Tuple2(++_currentPage, _pageSize));
  //   newResponse.fold((left) {
  //     CustomSnackBar.show(Get.context!, left.message, ContentType.failure);
  //   }, (right) {
  //     images.addAll(right.results!);
  //     unsplashSearchResponse.value?.total = right.total;
  //     _isLoadMore = false;
  //     checkScreenFilledWithImages();
  //   });
  // }

  void _scrollListener() {
    if (scrollController.hasClients) {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        print("load more");
        // loadMore();
      }
    }
  }

  void infoPop(String title, String msg) {
    Get.defaultDialog(
      title: title,
      titleStyle: const TextStyle(color: Colors.red),
      middleText: msg,
    );
  }

  void addMyPhoto() {
    int position = ((visibleRowsCount / 2).floor() * itemsInEachRow) +
        Random().nextInt((itemsInEachRow ~/ 2)) +
        (itemsInEachRow / 2).ceil();

    if (position > images.length)
      position = Random().nextInt(itemsInEachRow) + itemsInEachRow;

    // images.insert(
    //     position,
    //     UnsplashImage(
    //         urls: UnsplashImageUrls(
    //             small: "https://pwa.miladjalali.ir/miladjalali.gif"),
    //         blurHash: "LPGcGlkWK+w[_Noes8NG.TRjRQt7"));
  }

  //----order
  
  //---bashet
  late ProdSamples prodList;
  int addItemsCount=0;
  addBasket() {
    int itemCount = 0;
    for (ProdListModel prf in prodList.prodData) {
      if (prf.addQty! > 0) {
        itemCount += 1;
      }
    }
    if (itemCount > 0) {
      // checkPop('Add to basket : ${itemCount.toString()}');
      addItemsCount+=itemCount;
      update();
    }
  }
  //---
}
