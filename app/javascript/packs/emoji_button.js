import { createPicker } from 'picmo';
import emojiData from 'emojibase-data/en/data.json';
import messages from 'emojibase-data/en/messages.json';

window.addEventListener("turbolinks:load", function() {
  // emojipicker生成
  const container = document.querySelector('.pickerContainer');
  const picker = createPicker({
    rootElement: container,
    emojiData,
    messages
  });

  //選択された絵文字をセットする
  picker.addEventListener('emoji:select', event => {
    document.getElementById('emoji_field').value = event.emoji;
  });
});