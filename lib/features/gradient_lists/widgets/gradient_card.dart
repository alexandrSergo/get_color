import 'package:get_color/viewer/view.dart';

class GradientCard extends StatefulWidget {
  const GradientCard({super.key, required this.gradient});

  final GradientModel gradient;

  @override
  State<GradientCard> createState() => _GradientCardState();
}

class _GradientCardState extends State<GradientCard> {

  @override
  Widget build(BuildContext context) {
    final List<String> favList = Provider.of<FavouriteProvider>(context).favList ?? [];
    final bool colorIsFavor = favList.contains(widget.gradient.gradientID);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 320,
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: shadow, offset: Offset(0, 2)),
                    BoxShadow(color: shadow, offset: Offset(1.5, 2.5)),
                    BoxShadow(color: shadow, offset: Offset(-1.5, 2.5)),
                  ],
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: const Alignment(0.8, 1),
                    colors: <Color>[
                      widget.gradient.color1,
                      widget.gradient.color2,
                      widget.gradient.color3,
                    ]
                  )
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    !colorIsFavor 
                      ? Provider.of<FavouriteProvider>(context, listen: false).addToFavorList(widget.gradient.gradientID) 
                      : Provider.of<FavouriteProvider>(context, listen: false).removeFromFavorList(widget.gradient.gradientID);
                  },
                  child: Icon(Icons.star, color: !colorIsFavor ? Colors.white24 : kGradientColor1, size: 30,)
                )
              ),
            ]
          ),
          const SizedBox(height: 10,),
          DefaultTabController(
            length: 3, 
            child: Column(
              children: [
                const SizedBox(
                  width: 320,
                  child: TabBar(
                    indicatorColor: kGradientColor2,
                    tabs: [
                      Tab(
                        child: Text('RGBO', style: tabStyle,),
                      ),
                      Tab(
                        child: Text('HEX', style: tabStyle,),
                      ),
                      Tab(
                        child: Text('ARGB', style: tabStyle,),
                      ),
                    ]
                  ),
                ),
                const SizedBox(height: 7,),
                SizedBox(
                  width: 320,
                  height: tabViewStyle.fontSize! * 4,
                  child: TabBarView(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            left: tabViewStyle.fontSize! * 4,
                            child: Column(
                              children: [
                                Text('${AppLocalizations.of(context)!.color} 1 : (${widget.gradient.getRGBO[0]})', style: tabViewStyle,),
                                const SizedBox(height: 3,),
                                Text('${AppLocalizations.of(context)!.color} 2 : (${widget.gradient.getRGBO[1]})', style: tabViewStyle,),
                                const SizedBox(height: 3,),
                                Text('${AppLocalizations.of(context)!.color} 3 : (${widget.gradient.getRGBO[2]})', style: tabViewStyle,),
                              ],
                            ),
                          ),
                          Positioned(
                            top: tabViewStyle.fontSize! * 0.3,
                            right: 10,
                            child: IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: '(${widget.gradient.getRGBO[0]})\n(${widget.gradient.getRGBO[1]})\n(${widget.gradient.getRGBO[2]})'));
                              },
                              icon: Icon(Icons.copy, color: Colors.grey[600],)
                            ),
                          )
                        ]
                      ),
                      Stack(
                        children: [
                          Positioned(
                            left: tabViewStyle.fontSize! * 6,
                            child: Column(
                              children: [
                                Text('${AppLocalizations.of(context)!.color} 1 : (${widget.gradient.getHEX[0]})', style: tabViewStyle,),
                                const SizedBox(height: 3,),
                                Text('${AppLocalizations.of(context)!.color} 2 : (${widget.gradient.getHEX[1]})', style: tabViewStyle,),
                                const SizedBox(height: 3,),
                                Text('${AppLocalizations.of(context)!.color} 3 : (${widget.gradient.getHEX[2]})', style: tabViewStyle,),
                              ],
                            ),
                          ),
                          Positioned(
                            top: tabViewStyle.fontSize! * 0.3,
                            right: 10,
                            child: IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: '(${widget.gradient.getHEX[0]})\n(${widget.gradient.getHEX[1]})\n(${widget.gradient.getHEX[2]})'));
                              },
                              icon: Icon(Icons.copy, color: Colors.grey[600],)
                            ),
                          )
                        ]
                      ),
                      Stack(
                        children: [
                          Positioned(
                            left: tabViewStyle.fontSize! * 4,
                            child: Column(
                              children: [
                                Text('${AppLocalizations.of(context)!.color} 1 : (${widget.gradient.getARGB[0]})', style: tabViewStyle,),
                                const SizedBox(height: 3,),
                                Text('${AppLocalizations.of(context)!.color} 2 : (${widget.gradient.getARGB[1]})', style: tabViewStyle,),
                                const SizedBox(height: 3,),
                                Text('${AppLocalizations.of(context)!.color} 3 : (${widget.gradient.getARGB[2]})', style: tabViewStyle,),
                              ],
                            ),
                          ),
                          Positioned(
                            top: tabViewStyle.fontSize! * 0.3,
                            right: 10,
                            child: IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: '(${widget.gradient.getARGB[0]})\n(${widget.gradient.getARGB[1]})\n(${widget.gradient.getARGB[2]})'));
                              },
                              icon: Icon(Icons.copy, color: Colors.grey[600],)
                            ),
                          )
                        ]
                      ),
                    ]
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}