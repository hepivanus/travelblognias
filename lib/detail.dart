import 'package:flutter/material.dart';
import 'package:travel/model/travel.dart';

class DetailPage extends StatelessWidget {
  final Travel travel;
  final double expandedHeight = 300;
  final double roundedContainerHeight = 50;
  DetailPage({required this.travel});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(
          slivers: <Widget>[
          _buildSilverHead(),
          SliverToBoxAdapter(
            child: _buildDetail(),
          ),
          ],
        ),
        Padding(
          padding:  EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            right: 15, left: 15,
          ),
          child: SizedBox(height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back, color: Colors.white),),
            Icon(Icons.menu, color: Colors.white,)
          ],),),
        ),
      ],),
    );
    
  }
  Widget _buildSilverHead() {
    return SliverPersistentHeader(delegate: 
    DetailSliverDelegate(
      travel: travel,
      expandedHeight: expandedHeight,
      roundedContainerHeight: roundedContainerHeight,
    ));
  }
  Widget _buildDetail(){
    return Container(
      color: Colors.white,
      child: Column(children: [
        _buildUserInfo(),
        Padding(
          padding:  EdgeInsets.all(15),
          child: Text("Travelling ke wilayah Sumatera, Anda akan disajikan banyak pemandangan alam, danau hingga pantai. Salah satu destinasi indah yang dapat dikunjungi traveler di wilayah Sumatera adalah Kepulauan Tello. Pulau ini sangat terpencil, sebab Pulau Tello merupakan gugusan kepulauan di Nias Selatan. Pulau Tello merupakan ibu kota kecamatan dari Pulau-Pulau Batu, Nias Selatan, salah satu kecamatan di Kabupaten Nias Selatan, Provinsi Sumatera Utara. Jumlah penduduk di Pulau tello sebanyak 8.000 jiwa dengan luas wilayah 18 km. Tak heran jika pulau ini sangat terpencil"
          , style: TextStyle(color: Colors.grey, fontSize: 15, height: 1.5),),
        ),
      ],
      ),
    );
    
  }
  Widget _buildUserInfo(){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 0),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(travel.url, width: 50, height: 50, fit: BoxFit.cover),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(travel.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(travel.location,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Spacer(),
        Icon(Icons.share, color: Colors.grey),
      ],),
    );
  }
}
class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expandedHeight;
  final double roundedContainerHeight;
  DetailSliverDelegate({required this.travel, required  this.expandedHeight, required this.roundedContainerHeight});
  
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(travel.url,
              width: MediaQuery.of(context).size.width,
              height: expandedHeight,
              fit: BoxFit.cover),
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          ),
          Positioned(
            
            top: expandedHeight - shrinkOffset - 120,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(travel.location, style: TextStyle(color: Colors.orange, fontSize: 15),),
                Text(travel.name, style: TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold),),
              ],
            ),),
      ],
    );
      }
  

  @override
  
  double get maxExtent => expandedHeight;

  @override
  
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
   return true;
  }
}
