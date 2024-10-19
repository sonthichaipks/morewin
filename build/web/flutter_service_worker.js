'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "95c73c7ac1eba4aeb6f11131e5672c13",
"assets/AssetManifest.bin.json": "93b75e773368c79bb69df30a76d1c5db",
"assets/AssetManifest.json": "3a576ee579e9ad02842e4b234948d9bd",
"assets/assets/fonts/arial.ttf": "fa3228aadde0db988e1822c2f736c131",
"assets/assets/fonts/arialbd.ttf": "858f5a50a4c3e5e6559a0c9b128eee60",
"assets/assets/fonts/arialbi.ttf": "b04eb00031bf4d82265b30855d7a314f",
"assets/assets/fonts/ariali.ttf": "97f1aa85e8ce271cd2a65759cb230397",
"assets/assets/fonts/ARIALN.ttf": "d20ba4eaaf26b7033da05fd59ed020ab",
"assets/assets/fonts/ARIALNB.ttf": "6debd7b47fbf196d9aea1dc4235439bb",
"assets/assets/fonts/ARIALNBI.TTF": "56e394b38fbf81afb437bc00884544f8",
"assets/assets/fonts/ARIALNI.TTF": "989670c4c82248bb6a8cec3558212374",
"assets/assets/fonts/ariblk.ttf": "ec8b4d9c0e68604dfbeda73d0213c82e",
"assets/assets/fonts/calibri.ttf": "3dea6da513097358f7fbb4408aacb736",
"assets/assets/fonts/calibrib.ttf": "42a59a6bffb64adb463af2b927753d53",
"assets/assets/fonts/calibrii.ttf": "672b86cf4d6a9304e008c9142a6a9225",
"assets/assets/fonts/calibril.ttf": "ca17c1d0451117324666a90f7537cc91",
"assets/assets/fonts/calibrili.ttf": "51991bce388163d3e30701ab1fdf6318",
"assets/assets/fonts/calibriz.ttf": "dd1ab2d1ba9ae460d6e842649fe5c100",
"assets/assets/fonts/Gabriola.ttf": "f579cc9aeeaa88e8b0948145bbe93afd",
"assets/assets/fonts/Kanit-Black.ttf": "a9f2d889e6e5214b12ac36acbe473c1d",
"assets/assets/fonts/Kanit-BlackItalic.ttf": "ca4e92974c4f18b4a992dbb0b5af5679",
"assets/assets/fonts/Kanit-Bold.ttf": "d204df3d775c0c90d1773a97743a77b5",
"assets/assets/fonts/Kanit-BoldItalic.ttf": "f9b01756fbee867fb24d9416c8b7ce97",
"assets/assets/fonts/Kanit-ExtraBold.ttf": "17da18f7f5bc05b5efba36a066c99e53",
"assets/assets/fonts/Kanit-ExtraBoldItalic.ttf": "5244691e806ce170f290d9a8bf837219",
"assets/assets/fonts/Kanit-ExtraLight.ttf": "e84e29e81d362635427900ac6ae8af07",
"assets/assets/fonts/Kanit-ExtraLightItalic.ttf": "30b6c18b3b39e6c320ccfe925182b62f",
"assets/assets/fonts/Kanit-Italic.ttf": "dc367df0fa268ab11b47a22f78fc832e",
"assets/assets/fonts/Kanit-Light.ttf": "3a5af91532287f228070af610add510c",
"assets/assets/fonts/Kanit-LightItalic.ttf": "624972b098da0b5965dbc48eb0566a4d",
"assets/assets/fonts/Kanit-Medium.ttf": "79d3ce8b773035a13ef1d63f5240e256",
"assets/assets/fonts/Kanit-MediumItalic.ttf": "00f1a4b9ffd6d0ca41d798617a42b15b",
"assets/assets/fonts/Kanit-Regular.ttf": "b935eb6769e902b3b0086459a7c55a05",
"assets/assets/fonts/Kanit-SemiBold.ttf": "802435446beb0e3178443e74b0d5a77f",
"assets/assets/fonts/Kanit-SemiBoldItalic.ttf": "ca3a8f66e8ce520947e826be41ce0e8f",
"assets/assets/fonts/Kanit-Thin.ttf": "c748332120e330503843622ce96d6ce5",
"assets/assets/fonts/Kanit-ThinItalic.ttf": "d7e82aacf9177327181323afec3ca32e",
"assets/assets/fonts/LeelaUIb.ttf": "a9b91a46b2d801f6985c0bd70c796185",
"assets/assets/fonts/leelawad.ttf": "7b3dd89457163c74080434c132a12c3b",
"assets/assets/fonts/leelawdb.ttf": "e5e5271a1b73fbf35b6de1da9c1bd54c",
"assets/assets/fonts/LeelawUI.ttf": "08a2b19ed564555b5048f6d8f2bfc622",
"assets/assets/fonts/LeelUIsl.ttf": "e01777522ba929ab9939e38363e01035",
"assets/assets/fonts/micross.ttf": "5fbae7a148389a502bc8fedbfc66b8af",
"assets/assets/fonts/MySocialIcons.ttf": "345787fe6cbe5bf827f3a84436278f6f",
"assets/assets/fonts/OpenSans-Bold.ttf": "7209581e972b976cd45fd3aff1bf38fb",
"assets/assets/fonts/OpenSans-BoldItalic.ttf": "aaf4fd882075d004f9f941d1db8b36a1",
"assets/assets/fonts/OpenSans-Italic.ttf": "8bb55f0b123438d9ad8c78ce8c96b3dc",
"assets/assets/fonts/OpenSans-Regular.ttf": "bda18a526fb212a5292b1966cbde3c59",
"assets/assets/fonts/tahoma.ttf": "013ec165105a40eb43bc1130d530bd1f",
"assets/assets/fonts/tahomabd.ttf": "ae4aef91c1d0a14fb7da1f924d04c4e9",
"assets/assets/fonts/Ubuntu-Bold.ttf": "e00e2a77dd88a8fe75573a5d993af76a",
"assets/assets/fonts/Ubuntu-Medium.ttf": "8e22c2a6e3a3c679787e763a97fa11f7",
"assets/assets/fonts/Ubuntu-Regular.ttf": "2505bfbd9bde14a7829cc8c242a0d25c",
"assets/assets/help.pdf": "46fc4970c6a9e26d6a63b62dee60a708",
"assets/assets/icon-png/background_earthtone.png": "ab2f48a9e993d8d867e3ca55b26a63f5",
"assets/assets/icon-png/CANCEL.png": "9f87ccbb857a6a3b485e711333578d4c",
"assets/assets/icon-png/cashcard.png": "234541f5358554216a94befbf5a4b67b",
"assets/assets/icon-png/ChangeTable.png": "9db09b1542af5a6e42d89acff3d308a9",
"assets/assets/icon-png/ChangeTableT.png": "08aaa666c61d87c0ac7cac842aac8dc8",
"assets/assets/icon-png/chargeBath.png": "d2b36c4247c19f5a1d8a9dbac5d46cf2",
"assets/assets/icon-png/chargeBath1.png": "ab80494e02d1b4e0f460b719bb7dbaf1",
"assets/assets/icon-png/chargePer.png": "ac723332f56e2e71b0f2987dfbbbf9e2",
"assets/assets/icon-png/chargePer1.png": "1c77c7fdde4e9d62e4ddbf67d6ba7bf0",
"assets/assets/icon-png/CHeckBill.png": "4ae49fc0f1936c0943131e141104db1f",
"assets/assets/icon-png/CHeckBill1.png": "f8f91d62bf54fe7e966295c2c79e3923",
"assets/assets/icon-png/cntran.jpg": "5547c9d4020d5c33ea2b413958f157d2",
"assets/assets/icon-png/cntrans.jpg": "2869ef739095caa8e814e2502c5f8850",
"assets/assets/icon-png/CouponDisc.png": "718dee30fcf6c769cffffe0967faa069",
"assets/assets/icon-png/CouponDisc1.png": "d6be9f36aba609a7acf99b2f5a849f6a",
"assets/assets/icon-png/creditcard.png": "a80f4609b39303bd9bcb384fd5cab28d",
"assets/assets/icon-png/CtrlF3.png": "09b9bce20683ecbf09be880e8d1f29cf",
"assets/assets/icon-png/CtrlF31.png": "0d4271ca57ff0847e225b99ed1ef3710",
"assets/assets/icon-png/CtrlF6.png": "a20f05c04b4a470d1579a51161765e8c",
"assets/assets/icon-png/CtrlF61.png": "bc74cd2afb13ce48ae537a4b7710fdf8",
"assets/assets/icon-png/currency.png": "20c51b1b8bf1d434a8fb9d2f51133d18",
"assets/assets/icon-png/debitcard.png": "a3ca3881edda10313474531507a548a6",
"assets/assets/icon-png/discBath.png": "0d2181c2ed97797c0111944d9f7cd805",
"assets/assets/icon-png/discBath1.png": "f018d1a0a6d7b4180eee41b96ffb1c26",
"assets/assets/icon-png/discPer.png": "ead6048b4f088611c9889b9182ab2c68",
"assets/assets/icon-png/discPer1.png": "70f523b57d028f797790c795b8151cdd",
"assets/assets/icon-png/doclogo.png": "6c6a0f8a600e48e32c6d7033d7433235",
"assets/assets/icon-png/download.jpg": "8acb10bb98117e4fb0ff492e30e9e631",
"assets/assets/icon-png/EAI-IN.png": "37c33167b53452546c046af6e1197a80",
"assets/assets/icon-png/edc.png": "b4d69e17a80000520884b23a0e247927",
"assets/assets/icon-png/EDIT.png": "7106b45c5bafcc4811b51319735573d0",
"assets/assets/icon-png/Enter.png": "1f9b1acdbddfb243f661489e19899a29",
"assets/assets/icon-png/Enter1.png": "92f5e1a129c84cb8c3755a7708ae8dd9",
"assets/assets/icon-png/erpayment.png": "115f0589d1b2e6377d248eea7875928a",
"assets/assets/icon-png/Exit.png": "82a3cac6eeb2fcfa55a109ad1469ddfd",
"assets/assets/icon-png/Exit1.png": "2fe2f63c9eac9c35b17b0f2ba77273ce",
"assets/assets/icon-png/Find.png": "02fc0d25d8139975c1e2e5bce4841eb3",
"assets/assets/icon-png/Find1.jpg": "a87e7af69672299b524e9fec2691bdb2",
"assets/assets/icon-png/Find1.png": "363ac68081acaf3b3fe2832e0388433e",
"assets/assets/icon-png/findBoth.jpg": "0329f69d293de6bc183e8ebed6808362",
"assets/assets/icon-png/findByName.png": "787b00175a7b9e0fb72ff9d02ef5d259",
"assets/assets/icon-png/Free.png": "69de34fcc2bde3a6373dd93bb6d1bd17",
"assets/assets/icon-png/Free1.png": "5bd9dc1a89466137297e803387359ca3",
"assets/assets/icon-png/Home.png": "22f7346dcd547a9a251a5a2f5a95136b",
"assets/assets/icon-png/Home1.png": "20a3aec035acfa02d07ffd13b051aabe",
"assets/assets/icon-png/icon_Back2.jpg": "f320e9db8057959ce0ebe491b939e774",
"assets/assets/icon-png/icon_changepassword2.jpg": "b53e3ba6f9a5bc44fd371c8f3425feb2",
"assets/assets/icon-png/icon_message.png": "f3e128ea8f538e13b72877202cac4be1",
"assets/assets/icon-png/member.png": "2d03b6cae11ab3c1ce286efe2594fcc7",
"assets/assets/icon-png/MemberF4.png": "3e5049ae32b5a1aa4a913ba8a7727adb",
"assets/assets/icon-png/MemberF41.png": "4493ae0fe9f31da426c40aff663df2f2",
"assets/assets/icon-png/minus.png": "06f1d257780dd0bcc4de266682ff7741",
"assets/assets/icon-png/ok.png": "12d4a1e7ea6a422a3c635017c5d044e5",
"assets/assets/icon-png/ok1.png": "f245705b45470272557fca8717cfab0c",
"assets/assets/icon-png/other_money.png": "ff81885698ec2888ad39179d01969802",
"assets/assets/icon-png/pageDisCharge.png": "08f5a559342f5709cc5c0a97818f23f4",
"assets/assets/icon-png/pageDisCharge1.png": "67919d580f3f981110da57b827c81989",
"assets/assets/icon-png/paymoney.jpg": "b6898e2ac6092f7cbfbf227c84e7fc64",
"assets/assets/icon-png/plus.png": "b9a0ea25ac973d7fd861d78a5840a72e",
"assets/assets/icon-png/pointaccum.png": "61a0d5606015519c9cbc23e2b18c3fe3",
"assets/assets/icon-png/printA4.png": "aa9eda8bd8f068d930e7b9de0c96cfe0",
"assets/assets/icon-png/receipt.png": "af1c4d11b3225c11dacb0649410429f9",
"assets/assets/icon-png/receipt_money.png": "323655bd1de4cf6852540f4ccc79a2ce",
"assets/assets/icon-png/reload.png": "8900df7e5bdeee557e86633092e05c39",
"assets/assets/icon-png/Rest-Billind.png": "560cf2596e329baf4e68819274c59154",
"assets/assets/icon-png/Rest-Cashier.png": "633a48640b70d7260ae037e8ad4a4d46",
"assets/assets/icon-png/Rest-Exit.png": "21f917487d79a918903103f803867519",
"assets/assets/icon-png/Rest-Exit1.png": "c24e0076de357bee84de22aeb41ea665",
"assets/assets/icon-png/Rest-Layout.png": "ad12988408b0466b287101175e1aa857",
"assets/assets/icon-png/Rest-Layout_show.png": "a4dbe07b0dcea2e60fa78cb34b303031",
"assets/assets/icon-png/Rest-SignOut.png": "7277f6aefe85c7a0e4878fbd25b630ce",
"assets/assets/icon-png/Rest-SignOut1.png": "bc04b008f4700341df73b0484798615c",
"assets/assets/icon-png/Rest-Taxinv.png": "9c5a1308db5cf7b2c13bc68c55a87e25",
"assets/assets/icon-png/RestCheckB.png": "04093cb7d7373deb0c8d4de1318a2434",
"assets/assets/icon-png/RestExit.png": "e17ccbb48577d9dcad17e3543019529e",
"assets/assets/icon-png/RestFindB.png": "408cdf8d399afd0caea1940775da8cf2",
"assets/assets/icon-png/restSignOut.png": "7277f6aefe85c7a0e4878fbd25b630ce",
"assets/assets/icon-png/ReturnSales.png": "30e97d700616d9f7479b69febc367eba",
"assets/assets/icon-png/ReturnSales1.png": "ab89bb969e5556c27d160b6bc538dc0a",
"assets/assets/icon-png/save.png": "b2ba841aa5b285ca50eba8a1a3f28cc5",
"assets/assets/icon-png/scoupon.png": "ce88dd91bfc1281d946cc448652cc721",
"assets/assets/icon-png/ShiftF4.png": "e96b85630efe72d772f3606f4298e77c",
"assets/assets/icon-png/ShiftF41.png": "851d57d39f5312ebbf4f80f181db2fdd",
"assets/assets/icon-png/ShiftF8.png": "6f10f27de97adb396810d45299c040d0",
"assets/assets/icon-png/ShiftF81.png": "b3924d1807e69253a5c34b5312c2e23e",
"assets/assets/icon-png/ShiftF9.png": "96f717d63ea95d4a690b51a7f3d744ea",
"assets/assets/icon-png/ShiftF91.png": "dc76948317d47fbbf48a856eda0fea58",
"assets/assets/icon-png/SighOut.png": "fcd6b44ec9b4b28317cceabb53b2c86f",
"assets/assets/icon-png/SighOut1.png": "779969e60f11d550f1124772c8984c40",
"assets/assets/icon-png/SpecialComm.png": "dd60fe7dd3949e8c08c5c4523865a84c",
"assets/assets/icon-png/SpecialComm1.png": "d240c8f3ddd0a65a6086bffb43ccc75b",
"assets/assets/icon-png/TakeOut.png": "7358657917154f1e9c13f8b6a925fe30",
"assets/assets/icon-png/testPrint.jpg": "3812ef10c2be130062959b31d4aa845e",
"assets/assets/icon-png/testPrintA4.jpg": "43a1f26be3c1234c0ec4bc0be224f464",
"assets/assets/icon-png/vaoid2.png": "f1a7b0e15bfe22ce75abd3380041755d",
"assets/assets/icon-png/view_order.jpg": "74bfabf2262177976c98fbabeb70f0fb",
"assets/assets/icon-png/Void.png": "36801edb29afe7ba21a5d5cb8eaa473e",
"assets/assets/icon-png/Void1.png": "f8574b130f8bb80761757f2220fefedf",
"assets/assets/icon-png/void2.png": "f1a7b0e15bfe22ce75abd3380041755d",
"assets/assets/icon-png/void21.png": "5ea192583b0f95efa8d821053f1090b8",
"assets/assets/icon-png/void_receipt2.png": "de76f6af4c6794a502e8c297ba32c9d9",
"assets/assets/icon-png/void_receipt21.png": "b241bef7111e03abf25f9fa918e58069",
"assets/assets/icons/burn.png": "51a00d14b99445134c8a11128b008510",
"assets/assets/icons/distance.png": "ed13215b061db489e5d452f3c0a74fd4",
"assets/assets/icons/Documents.svg": "51896b51d35e28711cf4bd218bde185d",
"assets/assets/icons/folder.svg": "40a82e74e930ac73aa6ccb85d8c5a29c",
"assets/assets/icons/media.svg": "059dfe46bd2d92e30bf361c2f7055c3b",
"assets/assets/icons/momo_logo.jpg": "539ba2d7fc5e204913631d9a11ad4003",
"assets/assets/icons/sleep.png": "6196f7d5ca8c361bce775098b428c4bf",
"assets/assets/icons/steps.png": "3c0a0084eb6bf70752bae7545cc694ce",
"assets/assets/icons/unknown.svg": "b2f3cdc507252d75dea079282f14614f",
"assets/assets/images/experience_card_bottom.png": "7f26368ff5bdb0fb4f2f8bb9d00dbfba",
"assets/assets/images/experience_card_top.png": "67ac1c8eddf1669a74ece7f9bd76c01a",
"assets/assets/images/ic_arrow_top_to_left.png": "948d2fef33b4104531929237f694f029",
"assets/assets/images/ic_arrow_top_to_right.png": "804646330c1d594107462ee3861337a5",
"assets/assets/images/ic_no_image.jpg": "99dfe90878f3be8b747e1e0b8fa347e4",
"assets/assets/images/irisa.jpg": "e0aa02073e3727bd0d84c54f4955a377",
"assets/assets/images/kargozare_man_1.png": "137bf731541d94e6b475b433782a7874",
"assets/assets/images/kargozare_man_2.png": "05b8e2c64370098dc2623cfb2d3be399",
"assets/assets/images/kargozare_man_3.png": "ad7dd3aae393865b67eb4845e5f0ea90",
"assets/assets/images/kargozare_man_4.png": "c2d5df4ce0d356afc3f35e0bb75535b2",
"assets/assets/images/kohmart_1.png": "2b1eda1e438c47ff9084bc5c50f1b3d5",
"assets/assets/images/kohmart_2.png": "2aeeafad7f9264e4939d2b0907381c5f",
"assets/assets/images/kohmart_3.png": "958a6da176d5e4ce76979c465edc0bb3",
"assets/assets/images/kohmart_4.png": "dbddd3c240330ad0a352fefa16fb7137",
"assets/assets/images/laptop_frame.png": "699f9fbd6f0201d62d726ce8335b2b50",
"assets/assets/images/man.png": "6459a78b8d655079c08d4249cbcc0db5",
"assets/assets/images/me.png": "0bc3ab0fbf79e221c4d5bf13565e24d7",
"assets/assets/images/mobile_frame.png": "7d334ee3e9d29bc6bb796e34ca99e3a5",
"assets/assets/images/nicode.jpg": "39e536386a8cb8c55a1db6112c745264",
"assets/assets/images/no_posts_yet.gif": "5d35e39988e3a183bdc3a9d2570d20a9",
"assets/assets/images/orthobiomed_1.png": "6c81adf073b15714fc4e91c4faf5adf5",
"assets/assets/images/orthobiomed_2.png": "70c7c3ae1092a481fac7b56e267fa88e",
"assets/assets/images/orthobiomed_3.png": "b391550416c6fd7649cf40b0fb668b81",
"assets/assets/images/programmer.gif": "4c7f35a416de9035446575105f350ed3",
"assets/assets/images/Screenshot%25202024-10-19%2520073503.png": "79a891c162946853295badac1d62090d",
"assets/assets/images/signin_balls.png": "bd4d290202345f5d4b9600f3a235fe8c",
"assets/assets/images/uplance.jpg": "742f9508cd9798ea07fc1fa0af795ae3",
"assets/assets/proimgs/aspirin.png": "c7d0f114411e4fdaf37f015270e4f56a",
"assets/assets/proimgs/ladyrobot-benefit.png": "a5d74e147ccb1e8b159f587d10e6fedf",
"assets/assets/proimgs/ladyrobot-charge.png": "8944e990b9db742b57c58de280ea4191",
"assets/assets/proimgs/ladyrobot-desc.png": "4afa5c89c325da66f1e1cd15204db7d4",
"assets/assets/proimgs/ladyrobot-family.png": "1ec62503aea4c102fdbc39433a02f22d",
"assets/assets/proimgs/ladyrobot-featured.png": "3c944444e8d13f8fd5e6e55f52cb661b",
"assets/assets/proimgs/ladyrobot-show.png": "0c86a7d27c399bfd7e3dfc5310ab47fa",
"assets/assets/proimgs/ladyrobot.png": "22e874df88a566b60feab222dc60ee79",
"assets/assets/proimgs/proBig1.png": "cffe027365ee4722a30cd62d3817a1f4",
"assets/assets/proimgs/proBig2.png": "8e6f935b0914ff373b271e3a85ac1672",
"assets/assets/proimgs/proBig3.png": "8ea8a69617e102771b6cb612294983d2",
"assets/assets/proimgs/reeman.png": "2060a846a49208cdae84014e889d6423",
"assets/assets/proimgs/robot-pro-1.png": "7e01d811bf7afa4b3dcc55d99840c1cc",
"assets/assets/svgs/f_logo.svg": "6912a762a309d1810ce577dc70d166c8",
"assets/assets/svgs/g_logo.svg": "e9fe8bd06ae007ab2c7b2d31b47b1c2b",
"assets/FontManifest.json": "6c63a69b26d7aa30ac7056fba88907cc",
"assets/fonts/MaterialIcons-Regular.otf": "2ea888d3a952c15c85053c0950b4c82b",
"assets/NOTICES": "f7f6e237b8d3bd7365779487c4309dc3",
"assets/packages/awesome_snackbar_content/assets/back.svg": "ba1c3aebba280f23f5509bd42dab958d",
"assets/packages/awesome_snackbar_content/assets/bubbles.svg": "1df6817bf509ee4e615fe821bc6dabd9",
"assets/packages/awesome_snackbar_content/assets/types/failure.svg": "cb9e759ee55687836e9c1f20480dd9c8",
"assets/packages/awesome_snackbar_content/assets/types/help.svg": "7fb350b5c30bde7deeb3160f591461ff",
"assets/packages/awesome_snackbar_content/assets/types/success.svg": "6e273a8f41cd45839b2e3a36747189ac",
"assets/packages/awesome_snackbar_content/assets/types/warning.svg": "cfcc5fcb570129febe890f2e117615e0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/flutter_inappwebview_web/assets/web/web_support.js": "509ae636cfdd93e49b5a6eaf0f06d79f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "fb509f505453ea7973cdf309c6aba494",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/youtube_player_flutter/assets/speedometer.webp": "50448630e948b5b3998ae5a5d112622b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "8b886e77b613951328acbae0e3d6c24e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "7366254fc9ef17672a00309af63a6337",
"/": "7366254fc9ef17672a00309af63a6337",
"main.dart.js": "aecd94158585e0782e2f71e6df5a2e2c",
"manifest.json": "89c0a7b3e31716cae3064f99846106b5",
"version.json": "96bfe4773770a98e386aff1e2cae6d0d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
