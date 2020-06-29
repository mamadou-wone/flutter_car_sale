// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:my_first_mobile_app/custom_icons/twitter_icons_icons.dart';
// import 'package:my_first_mobile_app/custom_widgets/CustomSmallButton.dart';
// import 'package:my_first_mobile_app/custom_widgets/CustomText.dart';

// const imgPrefix = "https://png.pngtree.com/png-clipart/20190516/original/";

// class MoviePreview extends StatefulWidget {
//   final double heightScreen;
//   final double widthScreen;
//   final int movieId;
//   final String movieTitle;
//   final String movieDate;
//   final String movieDescription;
//   final String movieImage;
//   final String movieScore;
//   final List movieCategorie;
//   final GlobalKey<ScaffoldState> scaffoldKey;

//   final double imgWidth = 0.3;
//   final double imgHeight = 0.2;
//   final double infoWidth = 0.7;
//   final double infoPadding = 0.01;

//   MoviePreview(
//       {@required this.heightScreen,
//       @required this.widthScreen,
//       @required this.movieId,
//       @required this.movieTitle,
//       @required this.movieDate,
//       @required this.movieDescription,
//       @required this.movieImage,
//       @required this.movieScore,
//       @required this.movieCategorie,
//       @required this.scaffoldKey});

//   @override
//   _MoviePreview createState() => _MoviePreview();
// }

// //On Définit un Etat de la classe MoviPreview
// class _MoviePreview extends State<MoviePreview> {
//   bool _isFovoride = true;
//   bool _showDescription = false;
//   int _numberLineDescription = 1;

//   GlobalKey _containerInfoKey = new GlobalKey();
//   GlobalKey _bottomInfoKey = new GlobalKey();
//   GlobalKey _topInfoKey = new GlobalKey();

//   Size getSize(GlobalKey key) {
//     if (key.currentContext != null) {
//       final RenderBox render = key.currentContext.findRenderObject();
//       final size = render.size;
//       return size;
//     } else {
//       return Size.zero;
//     }
//   }

//   @override
//   void setState(fn) {
//     if (mounted) {
//       super.setState(fn);
//     }
//   }

//   int calculateNumberLineDescription() {
//     double containerHeight = getSize(_containerInfoKey).height;
//     double bottomInfoHeight = getSize(_bottomInfoKey).height;
//     double topInfoHeight = getSize(_topInfoKey).height;

//     double restHeight = containerHeight - (bottomInfoHeight + topInfoHeight);

//     return (restHeight / 20).floor();
//   }

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       setState(() {
//         _numberLineDescription = calculateNumberLineDescription();
//         _showDescription = true;
//       });
//     });
//   }

//   Widget moviePoster() {
//     double imgHight = widget.imgHeight * widget.heightScreen;
//     double imgWidth = imgHight / 1.5;

//     return GestureDetector(
//       child: CachedNetworkImage(
//         imageUrl: imgPrefix + widget.movieImage,
//         height: imgHight,
//         width: imgWidth,
//         fit: BoxFit.fill,
//         placeholder: (context, url) {
//           return Container(
//             height: imgHight,
//             width: imgWidth,
//             color: Colors.grey[200],
//           );
//         },
//       ),
//       onTap: () {
//         print("Click Image");
//       },
//     );
//   }

//   Widget topInfoMovie() {
//     return Column(
//       key: _topInfoKey,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         CustomText(
//           text: widget.movieTitle,
//           fontColor: FontColor.dark,
//           fontSize: FontSize.md,
//           fontWeight: FontWeight.bold,
//         ),
//         Padding(padding: EdgeInsets.only(top: 3)),
//         CustomText(
//           text: "Date ",
//           fontColor: FontColor.darkGrey,
//           fontSize: FontSize.sm,
//           fontWeight: FontWeight.bold,
//         ),
//         Padding(padding: EdgeInsets.only(top: 3)),
//         CustomText(
//           text: "Genre ",
//           fontColor: FontColor.darkGrey,
//           fontSize: FontSize.sm,
//           fontWeight: FontWeight.bold,
//         ),
//         Padding(padding: EdgeInsets.only(top: 5)),
//         Visibility(
//           visible: _showDescription,
//           child: CustomText(
//             text: widget.movieDescription,
//             fontColor: FontColor.darkGrey,
//             maxLines: _numberLineDescription,
//             fontSize: FontSize.xs,
//           ),
//         )
//       ],
//     );
//   }

//   Widget bottomInfoMovie() {
//     return Row(
//       key: _bottomInfoKey,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         CustomSmallButton(
//           text: 'Voir',
//           backgroundButton: Theme.of(context).primaryColor,
//           fontColor: FontColor.blue,
//           icon: TwitterIcons.flash_on,
//           borderColor: Theme.of(context).primaryColor,
//           onPressed: () {
//             print('click');
//           },
//         ),
//         Padding(padding: EdgeInsets.only(right: 3)),
//         CustomText(
//           text: widget.movieScore.toString() + "/10",
//           fontColor: FontColor.darkGrey,
//           fontSize: FontSize.sm,
//           fontWeight: FontWeight.bold,
//         ),
//       ],
//     );
//   }

//   Widget movieInfo() {
//     return Expanded(
//         child: Container(
//       key: _containerInfoKey,
//       padding: EdgeInsets.all(widget.infoPadding * widget.widthScreen),
//       height: widget.heightScreen * widget.imgHeight,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           topInfoMovie(),
//           bottomInfoMovie(),
//         ],
//       ),
//     )
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       width: widget.widthScreen,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           moviePoster(),
//           movieInfo(),
//         ],
//       ),
//     );
//   }
// }
