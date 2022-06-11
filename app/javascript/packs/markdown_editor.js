import * as EasyMDE from 'easymde';
import "easymde/dist/easymde.min.css";

window.onload = function(){
  var easyMDE = new EasyMDE({
    uploadImage: true,
    imagePathAbsolute: true,
    imageUploadEndpoint: '任意のエンドポイント',
    showIcons: ['strikethrough', 'code', 'table', 'redo', 'heading', 'undo', 'heading-bigger', 'heading-smaller', 'heading-1', 'heading-2', 'heading-3', 'clean-block', 'horizontal-rule'],
    element: document.getElementById('idea_detail')
  });
  
  console.log(document.getElementById('idea_detail'));
};
