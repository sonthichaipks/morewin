class ApiPath {
  ApiPath();

  static const String _apiPathSO = //
      // 'http://192.168.1.102:65177';
      'http://202.44.229.165:5988';
  // 'http://127.0.0.1:89';

  static String apiPathSO = _apiPathSO;
  refresh_apiPathSO(String apipathso) {
    apiPathSO = apipathso;
  }

  static const String _apiPathPO = //
      // 'http://192.168.1.102:65177';
      'http://202.44.229.165:5988';
  // 'http://127.0.0.1:89';

  static String apiPathPO = _apiPathPO;
  refresh_apiPathPO(String apipathpo) {
    apiPathPO = apipathpo;
  }

  static const String _apiPath = //
      // 'http://192.168.1.102:65177';
      'http://202.44.229.165:5988';
  // 'http://127.0.0.1:89';

  //// 'http://127.0.0.1:89'; //{dev local api}
  //'http:192.168.1.102:65177'(realtime api) , 'http://10.1.1.11:65177'(cloud api)
  static String apiPath = _apiPath;
  //http://127.0.0.1:89/lookups/261/a/b
  ///DashInfo/EndMonthProcess
  static String endmthpro =
      '$apiPath/DashInfo/EndMonthProcess'; //---post2 --QryDash
  static String lupSku = '$apiPath/Lookups/[SKU]/[MODE]';
  // https://localhost:44381/Lookups/LookupSupp
  static String lupSupp = '$apiPath/Lookups/[SUP]';
  // https://localhost:44381/Lookups/LookupMpo
  static String lupMpo = '$apiPath/Lookups/[MPO]/a/b';
  static String lupShop = '$apiPath/Lookups/[SHOP]/a/b/c';

  static String csPlus = '$apiPath/csplus';
  static String pluPrice =
      '$apiPath/PluPrices/i'; //PluPrices/i/00010/X/8850006577493
  //http://150.95.91.235:8899/posstation
  static String posStation = '$apiPath/posstation';
  static String cashier = '$apiPath/cashier';
  static String savepostrans = '$apiPath/savepostrans';
  static String voidpostrans = '$apiPath/psVoid';
  static String promadv = '$apiPath/PromAdv';
  //http://[baseurl]/
  static String savereceipts =
      '$savepostrans/savepostrans/[POSID]/[DOCNO]/B/R/[DATA]';
  //[DATA]
  //  paytype = checkNull(data, 0);
  //                       lineno = checkNull(data, 1);
  //                       receiptamt = checkNull(data, 2);
  //                       reftype = checkNull(data, 3);
  //                       refno = checkNull(data, 4);
  //                       pointburn = checkNull(data, 5);
  //                       curcycode = checkNull(data, 6);
  //                       curcyamt = checkNull(data, 7);
  //                       excrate = checkNull(data, 8);
  static String savebill = '$savepostrans/[POSID]/[DOCNO]/E/1/[DATA]';
  //[DATA]
  // vattype = checkNull(data, 0);
  //                 tverify = checkNull(data, 1);
  //                 cashier = checkNull(data, 2);
  //                 refdoc = checkNull(data, 3);
  //                 mbid = checkNull(data, 4);
  //                 slmnid = checkNull(data, 5);
  //                 cashIn = checkNull(data, 6);
  //                 cashOut = checkNull(data, 7);
  //                 shiftId = checkNull(data, 8);
  //http://150.95.91.235:8899/PromAdv/1G000100010000153-EV
  //---sales page B
  static String getGrpPanel = '$apiPath/grppnl/RT000';
  //http://150.95.91.235:8899/pnlitem/RT000/1
  // static const String getItemPanel = '$apiPath/pnlitem/RT000';
  static String getItemPanel = '$apiPath/pnlitem';
  //http://150.95.91.235:8899/GetPosSignin/i/00010/001/001/0
  static String getPosSignin = '$apiPath/GetPosSignin/i'; //00010/001/001/0';

//http://150.95.91.235:8899/Order/12823428/d
//http://150.95.91.235:8899/Order/i/G1001/i
  static String getOrderHd = '$apiPath/Order/[SHOP]/i';
  static String getOrderDt = '$apiPath/Order/[ORDERNO]/d';
  // http://150.95.91.235:8899/HoldBill/i/232
  static String getHoldHd = '$apiPath/HoldBill/i/[POSID]';
  static String getHoldDt = '$apiPath/HoldBill/[DOCNO]';
  // http://150.95.91.235:8899/savePosTrans/1G000100010000013
  static String getSalesHd = '$apiPath/savePosTrans/[DOCNO]';
  // http://150.95.91.235:8899/savePosTrans/1G000100010000013/2/3
  static String getSalesDt = '$apiPath/savePosTrans/[DOCNO]/2/3';

  //----------------25/11/23
  //https://localhost:7003/ExChange
  //https://localhost:7003/PaymentInfo/4 - discountCoupon
  static String getDiscCoupon = '$apiPath/PaymentInfo/4';
  static String getCurrency = '$apiPath/PaymentInfo/1'; //--no have this
  //https://localhost:7003/csSalesman
  static String getCredit = '$apiPath/PaymentInfo/2';
  //https://localhost:7003/csSalesman
  static String getDebit = '$apiPath/PaymentInfo/3'; //--no have this
  //https://localhost:7003/csSalesman
  static String getCashCoupon = '$apiPath/PaymentInfo/5';
  //https://localhost:7003/csSalesman
  //https://localhost:7003/csSalesman
  static String getSalesmanList = '$apiPath/csSalesman';
  //https://localhost:7003/Member
  static String getMemberList = '$apiPath/Member';
  //150.95.91.235:8899/pluprices/i/00010/X/9
  static String getBasicPricePMP = '$apiPath/PluPrices/i/';
  //​/PmUnitPrice​/{i}​/{posid}​/{mbid}​/{plu}
  static String getPmPricePMP = '$apiPath/PmUnitPrice/i/';

  ///HoldBill/{posid}
  static String getHoldbillByPosId = '$apiPath/HoldBill/';
  //​/PluPrices​/{i}​/{posid}​/{mbid}​/{plu}

  ///HoldBill/{posid}
  static String getSalesForReturn = '$apiPath/HoldBill/';
  //​/PluPrices​/{i}​/{posid}​/{mbid}​/{plu}]/
  // CSPara
  static String getcspara = '$apiPath/CsParam';
  static String getsupplier = '$apiPath/Supplier/i';
  static String getsupplierByPo =
      '$apiPath/Supplier/i/[fromdate]/[todate]/[id]';
  //---MomoMng
  // http://127.0.0.1:89/sales/xxx/3/2069/a/b
  // 127.0.0.1:89/sales/3/1.4/a/89  -- sku only
  // http://127.0.0.1:89/sales/SPR-666/3/xxx/a/b
  static String getprFormula = '$apiPath/sales/xxx/[mode]/[sku]/a/b';
  static String getprFormulaSup = '$apiPath/sales/[sup]/[mode]/[sku]/a/b';
// http://127.0.0.1:89/sales/885/1
  static String getprFormulaSku = '$apiPath/sales/[sku]';
  static String getprFormulaSkuByCat = '$apiPath/sales/[mode]/[sku]';
  // 127.0.0.1:89/sales/3/1.4/SPR-468/a/9 -- vendor - sku

  static String getprQryTable = '$apiPath/qrydatum';
  //--http://127.0.0.1:89/qrydatum/i/3 --query tables list by qryNumber (0-9)
  static String getprQryId =
      '$apiPath/qrydatum/a/[QryMenu]/[BeginDate]/[EndDate]/[goal]/[plan]';
  static String getLastQryData = '$apiPath/qrydatum';
//  127.0.0.1:89/QryDatum/1/2/3
  static String addAndgetprQryTables =
      '$apiPath/qrydatum/i/a/[QryMenu]/[BeginDate]/[EndDate]/[goal]/[plan]';
  //GET:  https://localhost:44381/QryDatum/i/a/QryMenu/3%2F2%2F2024/5%2F2%2F2024/1000/1.4

// https://localhost:44381/FgExp/CONTENT CODE/mode(-1,[0,1,2])/aging(0-3)
//https://localhost:44381/FgExp/[mode](0, 1,2,3)/[aging(-1,1,2,3)]';
  static String FgExp = '$apiPath/FgExp/[CONTENT]/[CTYPE]/[AGING]';

//https://localhost:44381/MpurOrder/MPO2405310117
  static String getMPOAll = '$apiPathPO/MpurOrder';
  static String updateAMPO =
      '$apiPathPO/MpurOrder/upPOnote'; //use mpo-model post
  static String getMPO = '$apiPathPO/MpurOrder/[PONO]';
  static String getMPOsuppLike = '$apiPathPO/MpurOrder/[SUP]/[PONO]/a/b/c/d';
  //https://localhost:44381/MpurOrder/i/f/MPO2405310117/d
  static String getMPOitem = '$apiPathPO/MpurOrder/i/f/[PONO]/d';
  static String getMPOitemFormula = '$apiPathPO/MpurOrder/i/f/[PONO]';
  //https://localhost:44381/MpurOrder/1/MPO2407221510/2/3/4/5/6
  static String getMPOitemForEdit = '$apiPathPO/MpurOrder/1/[PONO]/2/3/4/5/6';

// ​/MpurOrder​/CreatePurOrder
  static String saveMPO = '$apiPathPO/MpurOrder/CreatePurOrder';
  static String saveMPOitem = '$apiPathPO/MpurOrder/CreatePurOrderItem';
  static String saveMPOitFormula =
      '$apiPathPO/MpurOrder/CreatePurOrderItFormula';
  static String updateMPOitFormula =
      '$apiPathPO/MpurOrder/UpdatePurOrderItFormula';
  //  https://localhost:44381/MpurOrder/i/38/2/5%2F30%2F2024/5%2F30%2F2024
  static String PoFollowup =
      '$apiPathPO/MpurOrder/i/[SCHKEY]/[CTYPE]/[STARTDATE]/[ENDDATE]';
//---POF
//https://localhost:44381/POF/[SUP]/[SKU]/sup/1/2
  static String PoFsupp = '$apiPathPO/POF/[SUP]/[SKU]/sup/1/2';
  //https://localhost:44381/POF/[SUP]/[SKU]/rcv
  static String PoFrcv = '$apiPathPO/POF/[SUP]/[SKU]/rcv';
  // https://localhost:44381/POF/[SUP]/[SKU]/po/1
  static String PoFpo = '$apiPathPO/POF/[SUP]/[SKU]/po/1';

//-------

// https://localhost:44381/MReceive/60/[SUP]/[CAT]/[SKU]
  static String getReceived = '$apiPath/MReceive/[DAYS]/[SUP]/[CAT]/[SKU]';

//http://127.0.0.1:89/login/admin
  static String getLogin = '$apiPath/login/[UNAME]';

// https://localhost:44381/MpurOrder/r/MPO2406142119
  static String deleteMPO = '$apiPath/MpurOrder/r';

//http://127.0.0.1:89/DashInfo
  static String dashInfos = '$apiPath/DashInfo';

  //

  refresh(String changeApi) {
    apiPath = changeApi;
    // apiPathPO = _apiPathPO; --fix IP on cloud only
    if (changeApi.split('.')[0].indexOf('127') >= 0) {
      //incase of development only!
      refresh_apiPathPO(changeApi);
    }
    dashInfos = '$apiPath/DashInfo';
    getLogin = '$apiPath/login/[UNAME]';

    getReceived = '$apiPath/MReceive/[DAYS]/[SUP]/[CAT]/[SKU]';
    PoFollowup =
        '$apiPathPO/MpurOrder/i/[SCHKEY]/[CTYPE]/[STARTDATE]/[ENDDATE]';
    //---POF
    //https://localhost:44381/POF/[SUP]/[SKU]/sup/1/2
    PoFsupp = '$apiPathPO/POF/[SUP]/[SKU]/sup/1/2';
    //https://localhost:44381/POF/[SUP]/[SKU]/rcv
    PoFrcv = '$apiPathPO/POF/[SUP]/[SKU]/rcv';
    // https://localhost:44381/POF/[SUP]/[SKU]/po/1
    PoFpo = '$apiPathPO/POF/[SUP]/[SKU]/po/1';

    getMPOitemForEdit = '$apiPathPO/MpurOrder/1/[PONO]/2/3/4/5/6';

    getMPOitemFormula = '$apiPathPO/MpurOrder/i/f/[PONO]';
    getMPOitem = '$apiPathPO/MpurOrder/i/f/[PONO]/d';
    getMPOAll = '$apiPathPO/MpurOrder';
    getMPO = '$apiPathPO/MpurOrder/[PONO]';
    getMPOsuppLike = '$apiPathPO/MpurOrder/[SUP]/[PONO]/a/b/c/d';
    saveMPO = '$apiPathPO/MpurOrder/CreatePurOrder';
    saveMPOitem = '$apiPathPO/MpurOrder/CreatePurOrderItem';
    saveMPOitFormula = '$apiPathPO/MpurOrder/CreatePurOrderItFormula';
    updateMPOitFormula = '$apiPathPO/MpurOrder/UpdatePurOrderItFormula';
    FgExp = '$apiPath/FgExp/[CONTENT]/[CTYPE]/[AGING]';
//----MomoMng
    getcspara = '$apiPath/CsParam';
    getsupplier = '$apiPath/Supplier/i';
    getsupplierByPo = '$apiPath/Supplier/i/[fromdate]/[todate]/[id]';
    getprFormula = '$apiPath/sales/xxx/[mode]/[sku]/a/b';
    //https://localhost:44381/Sales/414/1.4/100/SPR-651/1/xxx
    getprFormulaSup = getprFormulaSup = '$apiPath/sales/[sup]/[mode]/[sku]/a/b';
    getprFormulaSku = '$apiPath/sales/[sku]';

    getprQryTable = '$apiPath/qrydatum';
    getprQryId = //'$apiPath/qrydatum/a/[QryMenu]/[BeginDate]/[EndDate]/[goal]/[plan]';
        '$apiPath/qrydatum/a/[QryMenu]/[BeginDate]/[EndDate]/[goal]/[plan]';
    addAndgetprQryTables =
        '$apiPath/qrydatum/i/a/[QryMenu]/[BeginDate]/[EndDate]/[goal]/[plan]';
    getLastQryData = '$apiPath/qrydatum';

//----
    csPlus = '$apiPath/csplus';
    pluPrice = '$apiPath/PluPrices/i'; //PluPrices/i/00010/X/8850006577493
    posStation = '$apiPath/posstation';
    cashier = '$apiPath/cashier';
    savepostrans = '$apiPath/savepostrans';
    voidpostrans = '$apiPath/psVoid';
    promadv = '$apiPath/PromAdv';
    savereceipts = '$savepostrans/savepostrans/[POSID]/[DOCNO]/B/R/[DATA]';
    savebill = '$savepostrans/[POSID]/[DOCNO]/E/1/[DATA]';
    getGrpPanel = '$apiPath/grppnl/RT000';
    getItemPanel = '$apiPath/pnlitem';
    getPosSignin = '$apiPath/GetPosSignin/i'; //00010/001/001/0';
    getOrderHd = '$apiPath/Order/[SHOP]/i';
    getOrderDt = '$apiPath/Order/[ORDERNO]/d';
    getHoldHd = '$apiPath/HoldBill/i/[POSID]';
    getHoldDt = '$apiPath/HoldBill/[DOCNO]';
    getSalesHd = '$apiPath/savePosTrans/[DOCNO]';
    getSalesDt = '$apiPath/savePosTrans/[DOCNO]/2/3';
    getDiscCoupon = '$apiPath/PaymentInfo/4';
    getCurrency = '$apiPath/PaymentInfo/1'; //--no have this
    getCredit = '$apiPath/PaymentInfo/2';
    getDebit = '$apiPath/PaymentInfo/3'; //--no have this
    getCashCoupon = '$apiPath/PaymentInfo/5';
    getSalesmanList = '$apiPath/csSalesman';
    getMemberList = '$apiPath/Member';
    getBasicPricePMP = '$apiPath/PluPrices/i/';
    getPmPricePMP = '$apiPath/PmUnitPrice/i/';
    getHoldbillByPosId = '$apiPath/HoldBill/';
    getSalesForReturn = '$apiPath/HoldBill/';
  }
}
