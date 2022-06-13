import * as EasyMDE from 'easymde';
import "easymde/dist/easymde.min.css";

window.onload = function(){
  var easyMDE = new EasyMDE({
    uploadImage: true,
    imagePathAbsolute: true,
    imageUploadEndpoint: '任意のエンドポイント',
    element: document.getElementById('idea_detail')
  });
};
