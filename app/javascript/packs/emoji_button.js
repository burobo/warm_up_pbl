import { createPicker } from 'picmo';
import emojiData from 'emojibase-data/en/data.json';
import messages from 'emojibase-data/en/messages.json';

window.addEventListener("turbolinks:load", function() {
  // 既存の絵文字取得
  const initEmoji = document.getElementById('init_emoji').value;
  // emojipicker生成
  const container = document.querySelector('.pickerContainer');
  const picker = createPicker({
    rootElement: container,
    emojiData,
    messages,
    initialEmoji:initEmoji
  });

  //選択された絵文字をセットする
  picker.addEventListener('emoji:select', event => {
    document.getElementById('emoji_field').value = event.emoji;
  });
});