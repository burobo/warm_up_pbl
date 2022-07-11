import * as EasyMDE from 'easymde';
import "easymde/dist/easymde.min.css";

window.addEventListener("turbolinks:load", function() {
  var easyMDE = new EasyMDE({
    spellChecker: false,
    toolbar: [
      'bold',
      'italic',
      'strikethrough',
      'heading',
      'code',
      'quote',
      'unordered-list',
      'ordered-list',
      'table',
      'horizontal-rule',
      'preview',
    ],
    // uploadImage: true,
    // imagePathAbsolute: true,
    // imageUploadEndpoint: '',
    element: document.getElementById('idea_detail')
  });
});
