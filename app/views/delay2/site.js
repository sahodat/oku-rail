// $(function(){
//   var DATA = []
//   var data = ["ueno-tokyo", "tokyo-shinagwa", "shinagwa-shibuya","shibuya-shinjyuku","shinjyuku-ikebukuro","ikebukuro-ueno"];
// for(var i=0;i<=5;i++) {
//     DATA.push({
//       label: data[i],
//       url: 'menu-'+i
//     });
//   }

//   var SELECTED = 'menu-0';

//   var OPTIONS = {
//     key: 'url',
//     pageLoader: {
//       target: null,
//       key: 'url'
//     }
//   }

//   var FUNC = {
//     onInit: function() {
//       console.log('INIT');
//     },
//     onChangeBegin: function() {
//       console.log('CHANGE');
//     },
//     onChangeComplete: function(d) {
//       console.log('CHANGE_COMPLETE')
//       console.log(d)
//     }
//   };

//   var circleMenu = new CircleMenu($('#my-circle-menu'), DATA, SELECTED, OPTIONS, FUNC);
// });
